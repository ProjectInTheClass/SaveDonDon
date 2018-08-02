
import Foundation
import UIKit

/**버킷리스트 메인 창*/
class BucketViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    var filteredData: [Bucket]! //검색바를 위한 변수
    var history: [Spend] = []
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var bucketSearch: UISearchBar!
    
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)

        
        self.filteredData = moneyPocket.bucket //필터데이터에 원본 데이터 복사
        table.reloadData() //어디서든 업뎃
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bucketSearch.delegate = self
        self.bucketSearch.placeholder = "버킷리스트 이름"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    /**테이블**/
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //3자리씩 끊어서 콤마
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let cell:BucketCell = tableView.dequeueReusableCell(withIdentifier: "BucketCell") as! BucketCell
        
        
        filteredData.sort(by: { $0.done < $1.done } ) //완료된 버킷이 아래로 깔리게 정렬된 데이터
        
        let info = filteredData[indexPath.row] //셀에 쓰는 데이터 ( row값에 맞게 가져옴 )
        
        cell.goalName?.text = info.bucketName
        cell.goalMoney?.text = numberFormatter.string(from: NSNumber(value: info.goalMoney))! + " 원"
        cell.goalImage?.image = info.bucketImg
        cell.donMoney?.text =  numberFormatter.string(from: NSNumber(value: info.dondonMoney))! + " 원"
        cell.donNum?.text = "x " + String(info.dondonNum)
        cell.progressBar.setProgress(CGFloat(info.percent), animated: true)
        
        

        //done 1일때 배경 회색
        if info.done == 1 {
            let doneImage = UIImageView(frame: UIScreen.main.bounds)
            doneImage.image = UIImage(named: "tableDone")
            doneImage.alpha = 0.2
            cell.backgroundView = doneImage
        } else
        {
            let ingImage = UIImageView(frame: UIScreen.main.bounds)
            ingImage.image = UIImage(named: "tableIng") //여기 흰색으로 변경
            cell.backgroundView = ingImage
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete{
            
            let alert = UIAlertController(title: "버킷 삭제 경고", message: "저축한 돈돈이가 사라집니다", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: UIAlertActionStyle.default) {
                (action: UIAlertAction) -> Void in
                deleteBucket()
            }
            let cancelAction = UIAlertAction(title: "취소", style: UIAlertActionStyle.default)
            alert.addAction(okAction)
            alert.addAction(cancelAction)
            self.present(alert, animated: true, completion: nil)
            
            
            func deleteBucket() {
                if let index = moneyPocket.bucket.index(of:filteredData[indexPath.row]) {
                    moneyPocket.bucket.remove(at: index) //버켓리스트 삭제
                    history =  moneyPocket.spend.filter{ $0.bucketIndex == index } //해당 버킷에 관련된 지출 뽑음
                }
                
                if history.count != 0 {
                    for i in 0...history.count - 1 {
                        if let index2 = moneyPocket.spend.index(of:history[i]) {
                            moneyPocket.spend.remove(at: index2) //원본배열에서 모두 삭제
                        }
                    } }
                
                filteredData.remove(at:indexPath.row) //필터된 데이터에도 삭제
                tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic) }
            
        }
    }
    
    
    
    //다음 창으로 넘어갈 때 준비함
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //연결된 세그가 테이블에서 연결된 편집창
        if segue.identifier == "editBucket"{
            let bucketSetting = segue.destination as! BucketSettingController //목적지는 버킷리스트 세팅창
            let cell = sender as! BucketCell //내가 누른 셀
            let indexPath:IndexPath = table.indexPath(for: cell)!
            
            let index = moneyPocket.bucket.index(of:filteredData[indexPath.row])
            history =  moneyPocket.spend.filter{ $0.bucketIndex == index }
            
            bucketSetting.bucket = filteredData[indexPath.row]
            bucketSetting.history = history
            
        }
        
        if segue.identifier == "DonDonSegue" {
            let button = sender as! UIButton
            let cell = button.superview?.superview as! BucketCell
            let indexPath:IndexPath = table.indexPath(for: cell)!
            let index = moneyPocket.bucket.index(of:filteredData[indexPath.row])
            
            let bucketSave = segue.destination as! BucketSaveController
            
            bucketSave.closureAfterUpdateUI = {
                self.table.reloadData()
            }
            
            bucketSave.bucket = filteredData[indexPath.row]
            bucketSave.index = index
        }
        
    }
    
    
    /**서치바에 입력한 내용의 범위에 있는 bucketName의 버킷을 찾아서 뿌려줌**/
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = searchText.isEmpty ? moneyPocket.bucket : moneyPocket.bucket.filter{ $0.bucketName.range(of: searchText) != nil }
        table.reloadData()
    }
    
    /** 텍스트 입력 시작할 때 취소버튼 보이기 */
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.bucketSearch.showsCancelButton = true
    }
    
    
    /**취소 버튼 클릭 시 키보드 닫히기, 검색어 초기화*/
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.bucketSearch.text = ""
        self.bucketSearch.showsCancelButton = false
        self.bucketSearch.endEditing(true) //키보드 내려감
        self.filteredData = moneyPocket.bucket
        table.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        self.bucketSearch.endEditing(true)

    }
    
    @IBAction func unWindBucketMain(segue: UIStoryboardSegue){
    }
    
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if identifier == "DonDonSegue"{
            let button = sender as! UIButton
            let cell = button.superview?.superview as! BucketCell
            let indexPath:IndexPath = table.indexPath(for: cell)!
            
            if filteredData[indexPath.row].done == 1 {
                let alert = UIAlertController(title: "완료된 버킷", message: "더 이상 저축이 불가합니다", preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: UIAlertActionStyle.default)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
                return false
            } else {
                return true }
        }
            
        else { return true }
    }
    
    
    
    
}


