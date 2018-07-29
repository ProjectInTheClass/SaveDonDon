
import Foundation
import UIKit

/**버킷리스트 메인 창*/
class BucketViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    var filteredData: [Bucket]! //검색바를 위한 변수
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var bucketSearch: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bucketSearch.delegate = self
        self.bucketSearch.placeholder = "버킷리스트 이름"
        self.filteredData = moneyPocket.bucket //동일하게 복사
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    
    //cell 리턴
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let info = filteredData[indexPath.row]
        let cell:BucketCell = tableView.dequeueReusableCell(withIdentifier: "BucketCell") as! BucketCell
        cell.goalName?.text = info.bucketName
        cell.goalMoney?.text = String(info.goalMoney)+"원"
        cell.goalImage?.image = info.bucketImg
        cell.donMoney?.text = String(info.dondonMoney)+"원"
        cell.donNum?.text = "x" + String(info.getTotalPig())
        cell.donMoney?.text = String(info.dondonMoney)+"원"
        
        
        return cell
    }
    
    //스와이프해서 삭제(수정 필요)
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete{
            if let index = moneyPocket.bucket.index(of:filteredData[indexPath.row]) {
                moneyPocket.bucket.remove(at: index)
            }
            filteredData.remove(at:indexPath.row) //데이터 삭제
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    
    
    
    //다음 창으로 넘어갈 때 준비함
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //연결된 세그가 테이블에서 연결된 편집창
        if segue.identifier == "editBucket"{
           let bucketSetting = segue.destination as! BucketSettingController //목적지는 버킷리스트 세팅창
            
            let cell = sender as! BucketCell //내가 누른 셀
            let indexPath:IndexPath = table.indexPath(for: cell)!
            filteredData[indexPath.row].selectedIndex = indexPath.row

            let index = moneyPocket.bucket.index(of:filteredData[indexPath.row])
            bucketSetting.bucket = filteredData[indexPath.row]
            bucketSetting.index = index
            
        }
        
        if segue.identifier == "DonDonSegue"{
            let bucketSave = segue.destination as! BucketSaveController //목적지는 버킷리스트 세팅창

            let button = sender as! UIButton
            
            let cell = button.superview?.superview?.superview as! BucketCell
            let indexPath:IndexPath = table.indexPath(for: cell)!
            
            
            filteredData[indexPath.row].selectedIndex = indexPath.row
            
            let index = moneyPocket.bucket.index(of:filteredData[indexPath.row])
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
        self.bucketSearch.endEditing(true)
        self.filteredData = moneyPocket.bucket
        table.reloadData()
    }


    
    @IBAction func unWindBucketMain(segue: UIStoryboardSegue){
        table.reloadData()
    }
    
    func addNewInfo(){
        filteredData = moneyPocket.bucket //실제 버킷에 바뀐 내용 업데이트
        table.reloadData()
    }
    
    
    
    
    
    
}


