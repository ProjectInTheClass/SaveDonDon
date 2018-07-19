//
//  BucketModel.swift
//  MoneySaver
//
//  Created by 홍정민 on 2018. 7. 19..
//  Copyright © 2018년 홍정민. All rights reserved.
//

import Foundation

class BucketInfo{
    let goalName:String
    let goalImg:String
    let goalMoney:Int
    let donMoney:Int
    let donNum:Int
    
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
    
    init(){
        self.arrayList = []
        self.arrayList.append(BucketInfo(goalName: "아이폰", goalImg: "pig", goalMoney: 200000, donMoney: 50000))
        self.arrayList.append(BucketInfo(goalName: "남미여행", goalImg: "lock", goalMoney: 300000, donMoney: 40000))
        self.arrayList.append(BucketInfo(goalName: "유럽여행", goalImg: "pig", goalMoney: 400000, donMoney: 30000))
        self.arrayList.append(BucketInfo(goalName: "포카리", goalImg: "lock", goalMoney: 300000, donMoney: 20000))
    }
    
}
