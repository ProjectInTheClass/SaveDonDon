
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
        cell.donMoney?.text = String(info.bucketMoney)+"원"
        
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
            let cell = sender as! BucketCell //내가 누른 셀
            let indexPath:IndexPath = table.indexPath(for: cell)!
            filteredData[indexPath.row].selectedIndex = indexPath.row
            let bucketSetting = segue.destination as! BucketSettingController //목적지는 버킷리스트 세팅창
            bucketSetting.bucket = filteredData[indexPath.row]
        }
        
        
    }
    
    /**서치바에 입력한 내용의 범위에 있는 bucketName의 버킷을 찾아서 뿌려줌**/
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = searchText.isEmpty ? moneyPocket.bucket : moneyPocket.bucket.filter{$0.bucketName.range(of: searchText) != nil }
        table.reloadData()
    }
    
    /** 텍스트 입력 시작할 때 취소버튼 보이기 */
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.bucketSearch.showsCancelButton = true
    }
    
    /**취소 버튼 클릭 시 키보드 닫히기, 검색어 초기화*/
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.bucketSearch.showsCancelButton = false
        self.bucketSearch.text = ""
        self.bucketSearch.resignFirstResponder()
        
    }
    
    @IBAction func unWindBucketMain(segue: UIStoryboardSegue){
        
    }
    
    func addNewInfo(info: Bucket){
        moneyPocket.bucket += [info]
        table.reloadData()
    }
    
    
    
    
    
    
}


