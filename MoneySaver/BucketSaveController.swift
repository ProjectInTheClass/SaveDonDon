

import UIKit


/**돈돈이 넣는 곳 **/
class BucketSaveController: UIViewController {

    var bucket: Bucket!

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var needPigLabel: UILabel! //필요 돈돈이 개수

    @IBOutlet weak var balanceLabel: UILabel! //잔액
    @IBOutlet weak var pigLabel: UILabel! //저축 가능 돈돈이 개수
    @IBOutlet weak var savePigText: UITextField!
    let numberFormatter = NumberFormatter()

    
    //돼지 넣는 액션
    @IBAction func savePig(_ sender: Any) {
    }
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var total = 0
        for income in moneyPocket.income {
            total += income.price
        }
        total += moneyPocket.deposit

        numberFormatter.numberStyle = .decimal
        
        nameLabel.text = bucket.bucketName
        needPigLabel.text = "x \(bucket.goalMoney / 10000)개"
        balanceLabel.text = numberFormatter.string(from: NSNumber(value: total))! + " 원"
        pigLabel.text = "\(total / 10000) 개"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
