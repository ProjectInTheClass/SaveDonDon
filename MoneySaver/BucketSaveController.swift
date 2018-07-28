

import UIKit


/**돈돈이 넣는 곳 **/
class BucketSaveController: UIViewController {
    
    var bucket: Bucket! //여기에는 filteredData[selectedIndex]값이 들어 있음.
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var needPigLabel: UILabel! //필요 돈돈이 개수
    @IBOutlet weak var balanceLabel: UILabel! //잔액
    @IBOutlet weak var pigLabel: UILabel! //저축 가능 돈돈이 개수
    @IBOutlet weak var savePigText: UITextField!
    let numberFormatter = NumberFormatter()
    
    var needPig: Int = 0
    var possiblePig: Int = 0
    
    //돼지 넣는 액션
    @IBAction func savePig(_ sender: Any) {
        
        let pig = savePigText.text! //내가 넣는 돼지 몇마리?
        
        
        let alert = UIAlertController()
 
        
        if pig.isEmpty {
            alert.title = "꿀꿀"
            alert.message = "저축할 돈돈이를 입력해주세요"
            let action = UIAlertAction(title: "확인", style: UIAlertActionStyle.default)
            alert.addAction(action)
            self.present(alert, animated: true, completion:nil)
        } else {
            let pigNum = Int(pig)!
            
            if pigNum > possiblePig {
                alert.title = "꿀꿀"
                alert.message = "돈돈이가 모자라요"
                let action = UIAlertAction(title: "확인", style: UIAlertActionStyle.default)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            } else if pigNum <= possiblePig {
                let date = NSDate()
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy.MM.dd"
                
                let pigDate = formatter.string(from: date as Date)
                let pig = Pig(date: pigDate, num: pigNum)
                bucket.savePig(pig: pig)
                moneyPocket.spend.append(Spend(date: pigDate, mc: "돈돈", history: "돈돈이", price: pig.num * 10000 ))
                
                alert.title = "꿀꿀"
                alert.message = "돈돈이가 넣기 성공!"
                let action = UIAlertAction(title: "확인", style: UIAlertActionStyle.default){ (action: UIAlertAction) -> Void in
                    self.refreshData()
                }
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
                
            }
        }
    }
    
    
    func refreshData(){
        numberFormatter.numberStyle = .decimal
        
        let balance = moneyPocket.getBalance() //잔액 받아오기
        needPig = bucket.getGoalPig() //필요한 돼지 수
        possiblePig = balance / 10000 //현재 돼지 수
        
        nameLabel.text = bucket.bucketName
        needPigLabel.text = "x \(needPig) 개"
        balanceLabel.text = numberFormatter.string(from: NSNumber(value: balance))! + " 원"
        pigLabel.text = "\(possiblePig) 마리"
    }

override func viewDidLoad() {
    super.viewDidLoad()
    refreshData()
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
