

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
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            bucketImgView.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        bucketNameField.delegate = self
        bucketMoneyField.keyboardType = .numberPad
    }
    

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = bucketNameField.text else { return true }
        let newLength = text.count + string.count - range.length
        return newLength <= 8 
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    //새로운 버킷리스트 추가
    func addInfo(){
        let bucketName = bucketNameField.text!
        let goalMoney = bucketMoneyField.text!
        let bucketImg = bucketImgView.image!
        
        //먼가 이상함 ;;;;;;;;;;;
        if bucketName.isEmpty || goalMoney.isEmpty {
            let alert = UIAlertController(title: "버킷 추가 불가", message: "모든 항목을 채워주세요", preferredStyle: .alert)
            let action = UIAlertAction(title: "확인", style: UIAlertActionStyle.default)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            
        }
        else if (Int(goalMoney)! % 10000 ) != 0 {
            let alert = UIAlertController(title: "버킷 금액 오류", message: "만원으로 나누어 떨어지게 입력해주세요\r\n ex) 20000원", preferredStyle: .alert)
            let action = UIAlertAction(title: "확인", style: UIAlertActionStyle.default)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        else {
            let newBucket = Bucket(bucketName: bucketName, bucketImg: bucketImg, goalMoney: Int(goalMoney)!)
            moneyPocket.bucket.append(newBucket)}
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //이상함;;;;;;
        if segue.identifier == "SaveSegue" {
            addInfo() //새로운 버킷 만들어서 추가
            let bucketVC = segue.destination as? BucketViewController
            bucketVC?.addNewInfo() //테이블뷰 갱신(메인)
        }
    }
    // prepare 전에 이 메서드가 호출됨. true 이면 segue 가 동작하기 시작하고, false 이면 동작 안함.
    // 지금 안되는 건, segue의 unwind 가 동작하는데, 화면 넘어가면 안되는데 계속 segue는 타는데,
    // alert이 올라와 있기 때문에, 경고 나면서 멈추는 거에요.
    // 위의 prepare 메서드와 아래 should 메서드에 break point 걸고 테스트 해보세요. :) 이해 될꺼임.
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return false
    }
}
