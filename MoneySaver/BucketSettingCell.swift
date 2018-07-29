//
//  BucketSettingCell.swift
//  MoneySaver
//
//  Created by 홍정민 on 2018. 7. 29..
//  Copyright © 2018년 홍정민. All rights reserved.
//

import UIKit

class BucketSettingCell: UITableViewCell {
    @IBOutlet weak var whenLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
