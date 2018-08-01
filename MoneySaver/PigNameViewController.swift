
import UIKit

class PigNameViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var pigNameText: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        pigNameText.delegate = self
        pigNameText.text = moneyPocket.pigName
        pigNameText.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == pigNameText {
            let text = textField.text
            let newLength = (text?.count)! + string.count - range.length
            return newLength <= 8 }
        else { return true }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "NameSaveSegue" {
            let pigName = pigNameText.text!
            if pigName.isEmpty {
                let alert = UIAlertController(title: "돈돈이 이름 저장 불가", message: "값을 입력해주세요", preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: UIAlertActionStyle.default)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
                return false
            }else {
                moneyPocket.pigName = pigName
                moneyPocket.save() //이거만 됨^^...
                return true }
        }
        return true
    }

}
