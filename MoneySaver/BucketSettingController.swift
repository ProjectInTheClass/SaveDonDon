

import Foundation
import UIKit

/**버킷리스트 편집 창**/
class BucketSettingController:UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet weak var bucketName: UITextField!
    @IBOutlet weak var bucketMoney: UITextField!
    @IBOutlet weak var bucketImg: UIImageView!
    @IBOutlet weak var imageView: UIImageView!

    var bucket: Bucket!
    var index: Int!
    let picker = UIImagePickerController()
    var history: [Spend]!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        picker.delegate = self
    }
    
    
    //이미지 추가
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
    
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let info = history[indexPath.row]
        let cell:BucketSettingCell = tableView.dequeueReusableCell(withIdentifier: "BucketSettingCell") as! BucketSettingCell
        
        cell.whenLabel?.text = info.date
        cell.priceLabel?.text = String(info.price)+"원"
        cell.percentLabel?.text = "몰러"
        
        return cell
        
        
    }
    
    //스와이프해서 삭제(수정 필요)
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete{
            if let index = moneyPocket.spend.index(of:history[indexPath.row]) {
                moneyPocket.spend.remove(at: index)
            }
            history.remove(at:indexPath.row) //데이터 삭제
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }

    }


    
    
}
