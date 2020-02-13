
import UIKit
import DLRadioButton



class MoneyBookAddController: UIViewController, UITextFieldDelegate {
    
    var typeString:String = ""
    var mcString:String = ""
    var history: String = ""
    var price:String = ""
    
    var selectedDate:String!
    
    @IBOutlet weak var dateText: UILabel!
    @IBOutlet weak var historyText: UITextField!
    @IBOutlet weak var priceText: UITextField!
   

    @IBAction func typeSelect(_ sender: DLRadioButton) {
        if(sender.currentTitle == "수입"){
            typeString = "수입"
        }
        else if(sender.currentTitle == "지출"){
            typeString = "지출"
        }
    }
    
    @IBAction func MCSelect(_ sender: DLRadioButton) {
        if sender.currentTitle == "카드" {
            mcString = "카드"
        }
        else if sender.currentTitle == "현금" {
            mcString = "현금"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateText.text = selectedDate
        historyText.delegate = self
        priceText.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    @objc func keyboardWillShow(_ sender: Notification) {
        self.view.frame.origin.y = -50
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func keyboardWillHide(_ sender: Notification) {
        self.view.frame.origin.y = 0
    }
    

    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == historyText {
            let text = textField.text
            let newLength = (text?.count)! + string.count - range.length
            return newLength <= 8 }
        else { return true }
    }
    
    
    
   /** 비어 있는지 체크 **/
    func emptyTest() -> Bool {
        
        history = historyText.text!
        price = priceText.text!
        
        if mcString == "" || typeString == "" || history.isEmpty || price.isEmpty {
            let alert = UIAlertController(title: "내역 저장 불가", message: "모든 항목을 채워주세요", preferredStyle: .alert)
            let action = UIAlertAction(title: "확인", style: .default)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            return false
        }
        
        return true
    }
    
    
    /**수입 추가**/
    func addIncome() -> Income {
        return Income(date: selectedDate, mc: mcString, history: history, price: Int(price)!)
    }
    
    
    /**지출 추가**/
    func addSpend() -> Spend {
        return Spend(date: selectedDate, mc: mcString, history: history, price: Int(price)!)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "AddSaveSegue" {
            return emptyTest()
        }else {
            return true }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddSaveSegue" {
            switch typeString{
            case "수입":
                let income = addIncome()
                moneyPocket.income += [income]
                moneyPocket.save()
            case "지출":
               let spend = addSpend()
                moneyPocket.spend += [spend]
                moneyPocket.save()
            default:
                return
            }
        }
    }
    
 
    
}
