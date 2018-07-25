
import UIKit
import DLRadioButton

//아직 현금, 카드 안됨 enum쓰고 싶은데 어케 하는지 모르겠네

class MoneyBookAddControllerViewController: UIViewController {
    var typeString:String?
    var selectedDate:String!
    
    @IBOutlet weak var dateText: UILabel!
    @IBOutlet weak var historyText: UITextField!
    @IBOutlet weak var priceText: UITextField!
   

    @IBAction func typeSelect(_ sender: DLRadioButton) {
        if(sender.currentTitle == "수입"){
            typeString = "수입"
        }
        else{
            typeString = "지출"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateText.text = selectedDate
    }
    
    
   /**수입 추가**/
    func addIncome() -> Income? {
        let history:String = historyText.text!
        let price:Int = Int(priceText.text!)!
        return Income(date: selectedDate, history: history, price: price)
    }
    
    /**지출 추가**/
    func addSpend() -> Spend? {
        let history:String = historyText.text!
        let price:Int = Int(priceText.text!)!
        return Spend(date: selectedDate, history: history, price: price)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddSaveSegue" {
            switch typeString{
            case "수입":
                guard let income = addIncome(), let moneyVC = segue.destination as? MoneyBookController
                    else{ return }
                moneyVC.income += [income]
                moneyVC.newAdd() //테이블 뷰 갱신
            case "지출":
                guard let spend = addSpend(), let moneyVC = segue.destination as? MoneyBookController
                    else{ return }
                moneyVC.spend += [spend]
                moneyVC.newAdd() //테이블 뷰 갱신
            default:
                return
            }
        }
        
    }
    
}
