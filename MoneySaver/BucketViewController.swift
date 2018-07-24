
import Foundation
import UIKit

/**버킷리스트 메인 창*/
class BucketViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var bucket = moneyPocket.bucket  //버킷리스트 여러 개 들어있음
    
    @IBOutlet weak var table: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bucket.count
    }
    
    
    //cell 리턴
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let info = bucket[indexPath.row]
        let cell:BucketCell = tableView.dequeueReusableCell(withIdentifier: "BucketCell") as! BucketCell
        cell.goalName?.text = info.bucketName
        cell.goalMoney?.text = String(info.goalMoney)+"원"
        cell.goalImage?.image = UIImage(named: info.bucketImg)
        cell.donMoney?.text = String(info.bucketMoney)+"원"
        cell.donNum?.text = "X " + String(info.donNum)
        
        return cell
    }
    
    //스와이프해서 삭제
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete{
            bucket.remove(at:indexPath.row) //데이터 삭제
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            
        }
    }
    
    //다음 창으로 넘어갈 때 준비함
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //연결된 세그가 테이블에서 연결된 편집창
        if segue.identifier == "editBucket"{
            let cell = sender as! BucketCell //내가 누른 셀
            let indexPath:IndexPath = table.indexPath(for: cell)!
           bucket[indexPath.row].selectedIndex = indexPath.row
            let bucketSetting = segue.destination as! BucketSettingController //목적지는 버킷리스트 세팅창
            bucketSetting.bucket = bucket[indexPath.row]
        }
        
        
    }
    
    
    @IBAction func unWindBucketMain(segue: UIStoryboardSegue){
        
    }
    
    func addNewInfo(info: Bucket){
        bucket += [info]
        table.reloadData()
    }
    
    
    
    
    
    
}


