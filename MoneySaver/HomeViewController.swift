//
//  HomeViewController.swift
//  MoneySaver
//
//  Created by swuad_08 on 2018. 7. 20..
//  Copyright © 2018년 홍정민. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    func updateTime() {
        
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        lbICurrentTime.txt = formatter.string(from: date as Date)
        
        //let date = formatter.string(from:Date())
        //dateLabel.txt = date

    }
   
}
