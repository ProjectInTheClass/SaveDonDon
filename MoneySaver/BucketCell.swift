

import UIKit
import YLProgressBar

class BucketCell: UITableViewCell {

    @IBOutlet weak var goalName: UILabel!
    @IBOutlet weak var goalImage:UIImageView!
    @IBOutlet weak var goalMoney: UILabel!
    @IBOutlet weak var donMoney: UILabel!
    @IBOutlet weak var donNum: UILabel!
    @IBOutlet weak var progressBar: YLProgressBar!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
