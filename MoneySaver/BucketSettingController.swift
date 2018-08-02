

import Foundation
import UIKit

/**버킷리스트 편집 창**/
class BucketSettingController:UIViewController, UITableViewDelegate, UITableViewDataSource {
  
   var bucket: Bucket!
   var index: Int!
   var history: [Spend]!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let info = history[indexPath.row]
        let cell:BucketSettingCell = tableView.dequeueReusableCell(withIdentifier: "BucketSettingCell") as! BucketSettingCell
        
        cell.whenLabel?.text = info.date
        cell.priceLabel?.text = String(info.price)+"원"
        cell.percentLabel?.text = "x \(info.price / 10000)"
        return cell
        
        
    }
    
    //스와이프해서 삭제(수정 필요)
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete{
            
            if let index = moneyPocket.spend.index(of:history[indexPath.row]) {
                moneyPocket.spend.remove(at: index) //원래 spend에서 삭제
                moneyPocket.save()
                bucket.dondonMoney -= history[indexPath.row].price //돈돈머니 빼줌
            }
            
            history.remove(at:indexPath.row) //필터된 곳에서 삭제
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }

    }


    
    
}
