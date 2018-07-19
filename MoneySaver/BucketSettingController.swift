//
//  BucketSettingController.swift
//  MoneySaver
//
//  Created by 홍정민 on 2018. 7. 19..
//  Copyright © 2018년 홍정민. All rights reserved.
//

import Foundation
import UIKit

class BucketSettingController:UIViewController{
    var modelBucket:BucketModel!

    @IBOutlet weak var bucketName: UITextField!
    @IBOutlet weak var bucketMoney: UITextField!
    @IBOutlet weak var bucketImg: UIImageView!
    
    override func viewDidLoad() {
        let infoBucket = modelBucket.arrayList[modelBucket.selectedIndex]
        
        bucketName.text = infoBucket.goalName
        bucketMoney.text = String(infoBucket.goalMoney)
        bucketImg.image = UIImage(named: infoBucket.goalImg)
        
    }
    
}
