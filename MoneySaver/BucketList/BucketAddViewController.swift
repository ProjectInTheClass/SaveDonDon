

import UIKit

/**버킷리스트 추가 창*/
class BucketAddViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    let picker = UIImagePickerController()
    
    @IBOutlet weak var bucketImgView: UIImageView!
    @IBOutlet weak var bucketNameField: UITextField!
    @IBOutlet weak var bucketMoneyField: UITextField!
    @IBOutlet weak var imageView: UIButton!
    @IBAction func addAction(_ sender: Any) {
        
        let alert = UIAlertController(title:"이미지 선택", message:"버킷리스트 이미지를 선택해주세요", preferredStyle: .actionSheet)
        let library = UIAlertAction(title: "사진앨범", style: .default) {(action) in self.openLibrary()}
        let camera = UIAlertAction(title: "카메라", style: .default) {(action) in self.openCamera()}
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(library)
        alert.addAction(camera)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
        
    }
    
    func openLibrary(){
        picker.sourceType = .photoLibrary
        present(picker, animated: false, completion: nil)
    }
    
    func openCamera(){
        if(UIImagePickerController .isSourceTypeAvailable(.camera)){
            picker.sourceType = .camera
            present(picker, animated: false, completion: nil)
        }
        else{
            
            print("카메라 안됨ㅋㅋ")
            
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
// Local variable inserted by Swift 4.2 migrator.
let info = convertFromUIImagePickerControllerInfoKeyDictionary(info)

        
        if let image = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.originalImage)] as? UIImage{
            bucketImgView.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        bucketNameField.delegate = self
        bucketMoneyField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
        
    @objc func keyboardWillShow(_ sender: Notification) {
        self.view.frame.origin.y = -150
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func keyboardWillHide(_ sender: Notification) {
        self.view.frame.origin.y = 0
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == bucketNameField {
        let text = textField.text
        let newLength = (text?.count)! + string.count - range.length
            return newLength <= 8 }
        else { return true }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    //새로운 버킷리스트 추가
    func addInfo() -> Bool {
        let bucketName = bucketNameField.text!
        let goalMoney = bucketMoneyField.text!
        let bucketImg = bucketImgView.image!
        
        if bucketName.isEmpty || goalMoney.isEmpty {
            let alert = UIAlertController(title: "버킷 추가 불가", message: "모든 항목을 채워주세요", preferredStyle: .alert)
            let action = UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            return false
            
        }
        else if (Int(goalMoney)! % 10000 ) != 0 {
            let alert = UIAlertController(title: "버킷 금액 오류", message: "만원으로 나누어 떨어지게 입력해주세요\r\n ex) 20000원", preferredStyle: .alert)
            let action = UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            return false
        }
        else {
            let newBucket = Bucket(bucketName: bucketName, bucketImg: bucketImg, goalMoney: Int(goalMoney)!)
            moneyPocket.bucket.append(newBucket)
            moneyPocket.save()
            return true
        }
        
    }
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "SaveSegue"{
            return addInfo() }
        else { return true }
    }
    
    
    
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
	return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
	return input.rawValue
}
