import UIKit


/**돈돈이 넣는 곳 **/
class BucketSaveController: UIViewController, UITextFieldDelegate {
    
    // 화면 업데이트를 위해서 호출할 클로저.
    var closureAfterUpdateUI:(() -> Void)?
    
    var bucket: Bucket! //여기에는 filteredData[selectedIndex]값이 들어 있음.
    
    @IBOutlet weak var nameLabel: UILabel! //버킷리스트 이름
    @IBOutlet weak var needPigLabel: UILabel! //필요 돈돈이 개수
    @IBOutlet weak var balanceLabel: UILabel! //잔액(자본금 + 수입 - 지출)
    @IBOutlet weak var pigLabel: UILabel! //저축 가능 돈돈이 개수
    @IBOutlet weak var savePigText: UITextField! //저축할 돈돈이 입력 개수
    
    let numberFormatter = NumberFormatter()
    var index: Int!
    var possiblePig: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshData()
        savePigText.delegate = self
       // savePigText.becomeFirstResponder() //포커스 주기
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    @objc func keyboardWillShow(_ sender: Notification) {
        self.view.frame.origin.y = -60
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func keyboardWillHide(_ sender: Notification) {
        self.view.frame.origin.y = 0
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func refreshData(){
        
        numberFormatter.numberStyle = .decimal
        
        if moneyPocket.balance <= 0 {
            possiblePig = 0
        }else {
            possiblePig = moneyPocket.balance / 10000
        }
        
        nameLabel.text = bucket.bucketName
        needPigLabel.text = "x \(bucket.goalDonNum) 개"
        balanceLabel.text = numberFormatter.string(from: NSNumber(value: moneyPocket.balance))! + " 원"
        pigLabel.text = "\(possiblePig) 마리"
    }
    
    
    //돼지 넣는 액션
    @IBAction func savePig(_ sender: Any) {
        
        let pig = savePigText.text! //내가 넣는 돼지 몇마리?
        let alert = UIAlertController()
        self.savePigText.resignFirstResponder() //포커스가 가는게 first responder,

        
        if pig.isEmpty {
            alert.title = "꿀꿀"
            alert.message = "저축할 돈돈이를 입력해주세요"
            let action = UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
            alert.addAction(action)
            self.present(alert, animated: true, completion:nil)
            return
        }
        
        let pigNum = Int(pig)!
        
        if pigNum == 0 {
            alert.title = "꿀꿀"
            alert.message = "0마리는 저축할 수 없어요"
            let action = UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        if pigNum > possiblePig {
            alert.title = "꿀꿀"
            alert.message = "돈돈이가 모자라요"
            let action = UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        } else if pigNum <= possiblePig {
            if bucket.dondonNum + pigNum > bucket.goalDonNum {
                alert.title = "꿀꿀"
                alert.message = "필요한 돈돈이보다 너무 많아요"
                let action = UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            } else {
                
                let date = NSDate()
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy.MM.dd"
                
                let dateStr = formatter.string(from: date as Date)
                
                moneyPocket.spend.append(Spend(date: dateStr, mc: "돈돈이", history: nameLabel.text!, price: pigNum * 10000, bucketIndex: index ))
                
                moneyPocket.bucket[index].dondonMoney += pigNum * 10000
                
                alert.title = "꿀꿀"
                alert.message = "돈돈이 넣기 성공!"
                let action = UIAlertAction(title: "확인", style: UIAlertAction.Style.default){ (action: UIAlertAction) -> Void in
                    self.dismiss(animated: true, completion: {
                        if let c = self.closureAfterUpdateUI {
                            moneyPocket.save()
                            c()
                        }
                    })
                }
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    
    
    
}
