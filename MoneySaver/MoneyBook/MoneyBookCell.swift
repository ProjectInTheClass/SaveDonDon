

import UIKit

class MoneyBookCell: UITableViewCell {

    @IBOutlet weak var todaysDate: UILabel!
    @IBOutlet weak var totalIncome: UILabel!
    @IBOutlet weak var totalSpend: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
