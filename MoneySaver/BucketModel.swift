//
//  BucketModel.swift
//  MoneySaver
//
//  Created by 홍정민 on 2018. 7. 19..
//  Copyright © 2018년 홍정민. All rights reserved.
//

import Foundation

class BucketInfo{
    let goalName:String //목표 이름
    let goalImg:String //목표 이미지
    let goalMoney:Int //목표 돈
    let donMoney:Int //모은 돈
    let donNum:Int //돈돈이 개수
    
    init(goalName:String, goalImg:String, goalMoney:Int, donMoney:Int) {
        self.goalName = goalName
        self.goalImg = goalImg
        self.goalMoney = goalMoney
        self.donMoney = donMoney
        self.donNum = donMoney/10000 //10000원으로 나누면 돈돈이 개수
    }
    
}

class BucketModel{
    var arrayList:Array<BucketInfo>
    var selectedIndex = 0
    init(){
        self.arrayList = []
        self.arrayList.append(BucketInfo(goalName: "미국여행", goalImg: "미국", goalMoney: 200000, donMoney: 50000))
        self.arrayList.append(BucketInfo(goalName: "남미여행", goalImg: "남미", goalMoney: 300000, donMoney: 40000))
        self.arrayList.append(BucketInfo(goalName: "유럽여행", goalImg: "유럽", goalMoney: 400000, donMoney: 30000))
        self.arrayList.append(BucketInfo(goalName: "미국여행", goalImg: "미국", goalMoney: 200000, donMoney: 50000))
        self.arrayList.append(BucketInfo(goalName: "남미여행", goalImg: "남미", goalMoney: 300000, donMoney: 40000))
        self.arrayList.append(BucketInfo(goalName: "유럽여행", goalImg: "유럽", goalMoney: 400000, donMoney: 30000))
    }
    
}
