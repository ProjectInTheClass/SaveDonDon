//
//  MoneyBookCheckCell.swift
//  MoneySaver
//
//  Created by 홍정민 on 2018. 7. 26..
//  Copyright © 2018년 홍정민. All rights reserved.
//

import UIKit

class MoneyBookCheckCell: UITableViewCell {
    
    @IBOutlet weak var typeImg: UIImageView!
    @IBOutlet weak var mcImg: UIImageView!
    @IBOutlet weak var historyLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
