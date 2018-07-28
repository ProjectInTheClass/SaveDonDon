
import UIKit
import DLRadioButton



class MoneyBookAddControllerViewController: UIViewController {
    var typeString:String?
    var mcString:String?
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
    
    @IBAction func MCSelect(_ sender: DLRadioButton) {
        if(sender.currentTitle == "카드"){
            mcString = "카드"
        }
        else{
            mcString = "현금"
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
        return Income(date: selectedDate, mc: mcString!, history: history, price: price)
    }
    
    /**지출 추가**/
    func addSpend() -> Spend? {
        let history:String = historyText.text!
        let price:Int = Int(priceText.text!)!
        return Spend(date: selectedDate, mc: mcString!, history: history, price: price)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddSaveSegue" {
            switch typeString{
            case "수입":
                guard let income = addIncome() else { return }
                moneyPocket.income += [income]
            case "지출":
                guard let spend = addSpend() else { return }
                moneyPocket.spend += [spend]
            default:
                return
            }
        }
    }
    
}
