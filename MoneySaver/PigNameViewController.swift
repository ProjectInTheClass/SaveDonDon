
import UIKit

class PigNameViewController: UIViewController {

    @IBOutlet weak var pigNameText: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

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
                return true }
        }
        return true
    }

}
