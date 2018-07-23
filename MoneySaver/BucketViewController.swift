
import Foundation
import UIKit

/**버킷리스트 메인 창*/
class BucketViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var table: UITableView!
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelBucket.arrayList.count
    }
    
    
    //cell 리턴
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let info = modelBucket.arrayList[indexPath.row]
        let cell:BucketCell = tableView.dequeueReusableCell(withIdentifier: "BucketCell") as! BucketCell
        cell.goalName?.text = info.goalName
        cell.goalMoney?.text = String(info.goalMoney)+"원"
        cell.goalImage?.image = UIImage(named: info.goalImg)
        cell.donMoney?.text = String(info.donMoney)+"원"
        cell.donNum?.text = "X " + String(info.donNum)
        
        return cell
    }
    
    //스와이프해서 삭제
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete{
            modelBucket.arrayList.remove(at:indexPath.row) //데이터 삭제
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            
        }
    }
    
    //다음 창으로 넘어갈 때 준비함
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //연결된 세그가 테이블에서 연결된 편집창
        if segue.identifier == "editBucket"{
            let cell = sender as! BucketCell //내가 누른 셀
            let indexPath:IndexPath = table.indexPath(for: cell)! //내가 누른 셀의 indexPath
            modelBucket.selectedIndex = indexPath.row //누른 곳의 인덱스를 indexPath.row로
            let bucketSetting = segue.destination as! BucketSettingController //목적지는 버킷리스트 세팅창
            bucketSetting.modelBucket = modelBucket //bucketSetting으로 modelbucket넘겨줌
        }
        
        
    }
    
    
    @IBAction func unWindBucketMain(segue: UIStoryboardSegue){
        
    }
    
    func addNewInfo(info: BucketInfo){
        modelBucket.arrayList.append(info)
        table.reloadData()
    }
    
    
    
    
    
    
}


