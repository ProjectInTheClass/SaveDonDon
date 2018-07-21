//
//  HomeViewController.swift
//  MoneySaver
//
//  Created by swuad_08 on 2018. 7. 20..
//  Copyright © 2018년 홍정민. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var dateLabel: UILabel!
   
    func updateTime() {
        
        let date = NSDate()
        let formatter = DateFormatter() //날짜 띄우는 포맷
        formatter.dateFormat = "yyyy.MM.dd" //포맷 지정
        let dateString = formatter.string(from: date as Date)
        dateLabel.text = dateString
        
    /*    lbICurrentTime.txt = formatter.string(from: date as Date)
        let date = formatter.string(from:Date())
        dateLabel.txt = date */

    }
    
    override func viewDidLoad() {
        updateTime()
    }
   
}
