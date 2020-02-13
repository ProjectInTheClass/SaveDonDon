//
//  HomePresenter.swift
//  MoneySaver
//
//  Created by 홍정민 on 2020. 2. 12..
//  Copyright © 2020년 홍정민. All rights reserved.
//

import Foundation

protocol HomeDelegate : NSObjectProtocol {
    func displayTodayDate(dateString : String)
    func displayDonDonLevel(level : String)
}

class HomePresenter {
    weak private var homeDelegate: HomeDelegate?
    
    func setViewDelegate(homeDelegate : HomeDelegate?){
        self.homeDelegate = homeDelegate
    }
    
    func getTodayDate(){
        //날짜 포맷변경 후 String
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        let dateString = formatter.string(from: date as Date)
        
        //Controller에서 label에 띄울 String값 전달
        self.homeDelegate?.displayTodayDate(dateString: dateString)
    }
    
    func getDonDonLevel(){
        let doneBucketListCount =  moneyPocket.bucket.filter{ $0.done == 1 }.count
        
        switch doneBucketListCount {
        case _ where doneBucketListCount < 1:
            let level = "1레벨"
            self.homeDelegate?.displayDonDonLevel(level: level)
            break
        case _ where doneBucketListCount < 5:
            let level = "2레벨"
            self.homeDelegate?.displayDonDonLevel(level: level)
            break
        case _ where doneBucketListCount < 10:
            let level = "3레벨"
            self.homeDelegate?.displayDonDonLevel(level: level)
            break
        case _ where doneBucketListCount < 20:
            let level = "4레벨"
            self.homeDelegate?.displayDonDonLevel(level: level)
            break
        default:
            let level = "1레벨"
            self.homeDelegate?.displayDonDonLevel(level: level)
            break
        }
    }
    
}
