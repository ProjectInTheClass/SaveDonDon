//
//  BucketCell.swift
//  MoneySaver
//
//  Created by 홍정민 on 2018. 7. 18..
//  Copyright © 2018년 홍정민. All rights reserved.
//

import UIKit

class BucketCell: UITableViewCell {

    @IBOutlet weak var goalName: UILabel!
    @IBOutlet weak var goalImage:UIImageView!
    @IBOutlet weak var goalMoney: UILabel!
    @IBOutlet weak var donMoney: UILabel!
    @IBOutlet weak var donNum: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
