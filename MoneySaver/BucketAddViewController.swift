

import UIKit

/**버킷리스트 추가 창*/
class BucketAddViewController: UIViewController {
    
    @IBOutlet weak var bucketImgView: UIImageView!
    @IBOutlet weak var bucketNameField: UITextField!
    @IBOutlet weak var bucketMoneyField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    
    //새로운 버킷리스트 추가(BucketInfo를 넘겨서 넘겨받는 쪽에서 append)
    func addInfo() -> Bucket? {
        let bucketName = bucketNameField.text!
        let goalMoney = Int(bucketMoneyField.text!)!
        let bucketImg = "pig" //변경해야 함, 값없으면 터지는 것도 변경해야함
        let bucketMoney = 0
        
        return Bucket(bucketName: bucketName, bucketImg: bucketImg, goalMoney: goalMoney, bucketMoney: bucketMoney)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SaveSegue" {
            guard let info = addInfo(),let bucketVC = segue.destination as? BucketViewController else{ return }
            bucketVC.addNewInfo(info: info)
        }
        
        
    }
}
