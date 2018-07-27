

import UIKit

/**버킷리스트 추가 창*/
class BucketAddViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let picker = UIImagePickerController()
    
    @IBOutlet weak var bucketImgView: UIImageView!
    @IBOutlet weak var bucketNameField: UITextField!
    @IBOutlet weak var bucketMoneyField: UITextField!
    @IBOutlet weak var imageView: UIButton!
    @IBAction func addAction(_ sender: Any) {
        
        let alert = UIAlertController(title:"원하는 타이틀", message:"원하는 메시지", preferredStyle: .actionSheet)
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
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    //새로운 버킷리스트 추가(BucketInfo를 넘겨서 넘겨받는 쪽에서 append)
    func addInfo() {
        let bucketName = bucketNameField.text!
        let goalMoney = Int(bucketMoneyField.text!)!
        let bucketImg = bucketImgView.image! //변경해야 함, 값없으면 터지는 것도 변경해야함
        
        let newBucket = Bucket(bucketName: bucketName, bucketImg: bucketImg, goalMoney: goalMoney)
        moneyPocket.bucket.append(newBucket)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SaveSegue" {
            addInfo() //새로운 버킷 만들어서 추가
            let bucketVC = segue.destination as? BucketViewController
            bucketVC?.addNewInfo() //테이블뷰 갱신(메인)
        }
        
        
    }
}
