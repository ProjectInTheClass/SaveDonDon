//
//  HomeViewController.swift
//  MoneySaver
//
//  Created by swuad_08 on 2018. 7. 20..
//  Copyright © 2018년 홍정민. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, HomeDelegate {
  
    
  
    private let homePresenter = HomePresenter()
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var donImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bucketLabel: UILabel!
    var doneCount = 0
    var ingCount = 0
    var totalCount = 0
    
    
//    // (1) 현재 날짜를 보여주는 함수 > Presenter에서 처리하도록 변경
//    func updateTime() {
//        let date = NSDate()
//        let formatter = DateFormatter() //날짜 띄우는 포맷
//        formatter.dateFormat = "yyyy.MM.dd" //포맷 지정
//        let dateString = formatter.string(from: date as Date)
//        dateLabel.text = dateString
//    }
    
    override func viewWillAppear(_ animated: Bool) {
       //오늘 날짜 출력
        homePresenter.getTodayDate()
        
        //돈돈이 이름 출력
        homePresenter.getDonDonName()
        
        //레벨에 따른 돈돈이 이미지 출력
        homePresenter.getDonDonLevel()
        
        //완료한 버킷리스트 개수 & 전체 버킷리스트 개수 출력
        homePresenter.getBucketListCount()
        
        
//        // 1 5 10 20
//
//        doneCount =  moneyPocket.bucket.filter{ $0.done == 1 }.count
//        ingCount = moneyPocket.bucket.filter{ $0.done == 0 }.count
//        totalCount = moneyPocket.bucket.count
//
//        switch doneCount {
//        case  _ where doneCount < 1 :
//            levelLabel.text = "레벨 1"
//            donImage.image = UIImage(named: "lv1")
//        case  _ where doneCount >= 1 && doneCount < 5 :
//            levelLabel.text = "레벨 2"
//            donImage.image = UIImage(named: "lv2")
//        case  _ where doneCount >= 5 && doneCount < 10 :
//            levelLabel.text = "레벨 3"
//            donImage.image = UIImage(named: "lv3")
//        case  _ where doneCount >= 10 && doneCount < 20 :
//            levelLabel.text = "레벨 4"
//            donImage.image = UIImage(named: "lv4")
//        case  _ where doneCount >= 20 :
//            levelLabel.text = "레벨 5"
//            donImage.image = UIImage(named: "lv5")
//        default:
//            print("hi")
//        }
//
//        bucketLabel.text = "\(doneCount) / \(totalCount)"
    }
    
    override func viewDidLoad() {
        homePresenter.setViewDelegate(homeDelegate : self)
    }
    
    func displayTodayDate(dateString : String) {
        dateLabel.text = dateString
    }
    
    func displayDonDonLevel(level: String, imageName : String) {
        levelLabel.text = level
        donImage.image = UIImage(named : imageName)
    }
    
    func displayDonDonName(name : String){
        nameLabel.text = name
    }
    
    func displayBucketListCount(doneBucketListCount : Int, totalBucketListCount : Int) {
        bucketLabel.text = "\(doneBucketListCount) / \(totalBucketListCount)"
    }
    
}
