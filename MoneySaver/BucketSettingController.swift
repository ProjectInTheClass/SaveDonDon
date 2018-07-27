

import Foundation
import UIKit

/**버킷리스트 편집 창**/
class BucketSettingController:UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var bucket: Bucket!
    let picker = UIImagePickerController()
  
    //이미지 추가
    @IBOutlet weak var imageView: UIImageView!
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
            
            bucketImg.image = image
            
            print(info)
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBOutlet weak var bucketName: UITextField!
    @IBOutlet weak var bucketMoney: UITextField!
    @IBOutlet weak var bucketImg: UIImageView!
    
    override func viewDidLoad() {
        bucketName.text = bucket.bucketName
        bucketMoney.text = "\(bucket.goalMoney)"
        bucketImg.image = bucket.bucketImg
        
        super.viewDidLoad()
        picker.delegate = self
    }
    
    
}
