
import Foundation
import UIKit

let moneyPocket: MoneyPocket = MoneyPocket(deposit: 100000) //자본금 3원짜리 지갑

class MoneyPocket {
    var deposit: Int
    var income: [Income]
    var spend : [Spend]
    var bucket : [Bucket]
    
    var balance: Int {
        var num = deposit
        
        for i in income
        {
            num += i.price
        }
        
        for i in spend {
            num -= i.price
        }
        
        return num
    }
    
    //앞에서 넘어온 시작 값과 자본금을 설정
    init(deposit:Int){
        income = []
        spend = []
        bucket = []
        self.deposit = deposit
        
        
        let income1 = Income(date: "2018.07.26",mc: "카드", history: "용돈", price: 100000)
        let income2 = Income(date: "2018.07.26",mc: "현금", history: "월급", price: 100000)
        let income3 = Income(date: "2018.07.26",mc: "카드", history: "근로", price: 100000)
        let income4 = Income(date: "2018.07.26",mc: "현금", history: "일급", price: 100000)
        income += [income1, income2, income3, income4]
        
        
        let spend1 = Spend(date: "2018.07.26",mc: "카드", history: "과자", price: 10000)
        let spend2 = Spend(date: "2018.07.26",mc: "현금", history: "빵", price: 10000)
        let spend3 = Spend(date: "2018.07.26",mc: "카드", history: "음료수", price: 10000)
        let spend4 = Spend(date: "2018.07.26",mc: "현금", history: "오징어", price: 10000)
        spend += [spend1, spend2, spend3, spend4]
        
        let americaBucket = Bucket(bucketName: "미국여행",bucketImg: UIImage(named: "미국")!, goalMoney: 1000000)
        let europeBucket =  Bucket(bucketName: "유럽여행",bucketImg: UIImage(named: "유럽")!, goalMoney: 100000)
        let nammiBucket = Bucket(bucketName: "남미여행", bucketImg: UIImage(named: "남미")!, goalMoney: 100000)
        
        bucket += [americaBucket, europeBucket, nammiBucket]
    }

    
}



class Income : Equatable {
    static func == (lhs: Income, rhs: Income) -> Bool {
        return lhs.timeStamp == rhs.timeStamp
    }
    
    let timeStamp = Date().timeIntervalSince1970
    
    let date: String
    let mc : String
    let history: String
    let price: Int
    
    init(date: String, mc: String, history: String, price:Int){
        self.date = date
        self.mc = mc
        self.history = history
        self.price = price
    }
}

class Spend: Equatable {
    
    static func == (lhs: Spend, rhs: Spend) -> Bool{
        return lhs.timeStamp == rhs.timeStamp
    }
    
    let timeStamp = Date().timeIntervalSince1970
    
    let date: String
    let mc : String
    let history: String
    let price: Int
    var bucketIndex: Int = -1

    
    init(date: String, mc: String, history: String, price:Int){
        self.date = date
        self.mc = mc
        self.history = history
        self.price = price
    }
    
    init(date: String, mc: String, history: String, price:Int, bucketIndex: Int){
        self.date = date
        self.mc = mc
        self.history = history
        self.price = price
        self.bucketIndex = bucketIndex
    }
}



class Bucket: Equatable{
    static func == (lhs: Bucket, rhs: Bucket) -> Bool{
        return lhs.timeStamp == rhs.timeStamp
    }
    
    let timeStamp = Date().timeIntervalSince1970
    let bucketName:String
    let bucketImg: UIImage
    let goalMoney:Int
    var dondonMoney:Int
   
    var goalDonNum: Int {
        return goalMoney / 10000
    }

    
    var dondonNum: Int {
        if dondonMoney == 0 { return 0 }
        else { return dondonMoney / 10000}
    }
   
    var percent:Double {
        if dondonMoney == 0 { return 0 }
        else { return Double(self.dondonMoney) / Double(self.goalMoney)  }
    }
    
    var done: Int {
        if dondonMoney == goalMoney { return 1 }
        else { return 0 }
    }
    
    init(bucketName:String, bucketImg:UIImage, goalMoney:Int) {
        self.bucketName = bucketName
        self.bucketImg = bucketImg
        self.goalMoney = goalMoney
        self.dondonMoney = 0
    }
    
    
    
    
}






