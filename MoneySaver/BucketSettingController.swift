

import Foundation
import UIKit

/**버킷리스트 편집 창**/
class BucketSettingController:UIViewController {
    var bucket: Bucket!
    
    @IBOutlet weak var bucketName: UITextField!
    @IBOutlet weak var bucketMoney: UITextField!
    @IBOutlet weak var bucketImg: UIImageView!
    
    override func viewDidLoad() {
        bucketName.text = bucket.bucketName
        bucketMoney.text = "\(bucket.goalMoney)"
        bucketImg.image = UIImage(named: (bucket.bucketImg))
    }
    
    
}
