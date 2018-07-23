

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
    func addInfo() -> BucketInfo? {
        let name = bucketNameField.text!
        let money = Int(bucketMoneyField.text!)!
        let img = "pig" //변경해야 함, 값없으면 터지는 것도 변경해야함

        return BucketInfo(goalName: name, goalImg: img, goalMoney: money, donMoney: 0)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SaveSegue" {
            guard let info = addInfo(),let bucketVC = segue.destination as? BucketViewController else{ return }
            bucketVC.addNewInfo(info: info)
        }
        
        
    }
}
