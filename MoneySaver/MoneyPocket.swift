
import Foundation
import UIKit

let moneyPocket: MoneyPocket = MoneyPocket(deposit: 10000)

class MoneyPocket {
    let deposit: Int //자본금
    var income: [Income]
    var spend : [Spend]
    var bucket : [Bucket]
    
    
    //앞에서 넘어온 시작 값과 자본금을 설정
    init(deposit:Int){
        income = []
        spend = []
        bucket = []
        self.deposit = deposit
  
        
        //수입 쓰레기값(하루 수입 600000원)
        let income1 = Income(date: "2018.07.26",mc: "카드", history: "용돈", price: 100000)
        let income2 = Income(date: "2018.07.26",mc: "현금", history: "월급", price: 200000)
        let income3 = Income(date: "2018.07.26",mc: "카드", history: "근로", price: 300000)
        income += [income1, income2, income3]
        
        
        //지출 쓰레기값(하루 지출 60000원)
        let spend1 = Spend(date: "2018.07.26",mc: "카드", history: "과자", price: 10000)
        let spend2 = Spend(date: "2018.07.26",mc: "현금", history: "빵", price: 20000)
        let spend3 = Spend(date: "2018.07.26",mc: "카드", history: "음료수", price: 30000)
        let spend4 = Spend(date: "2018.07.26",mc: "현금", history: "오징어", price: 40000)

        spend += [spend1, spend2, spend3, spend4]
        
        //버킷리스트 쓰레기값
        let americaBucket = Bucket(bucketName: "미국여행",bucketImg: UIImage(named: "미국")!, goalMoney: 100000)
        let europeBucket =  Bucket(bucketName: "유럽여행",bucketImg: UIImage(named: "유럽")!, goalMoney: 50000)
        let nammiBucket = Bucket(bucketName: "남미여행", bucketImg: UIImage(named: "남미")!, goalMoney: 140000)
        
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
    
    init(date: String, mc: String, history: String, price:Int){
        self.date = date
        self.mc = mc
        self.history = history
        self.price = price
    }
}



class Bucket: Equatable{
    static func == (lhs: Bucket, rhs: Bucket) -> Bool{
        return lhs.timeStamp == rhs.timeStamp
    }
    
    var selectedIndex = 0
    let timeStamp = Date().timeIntervalSince1970
    
    //추가할때 필요함
    let bucketName:String
    let bucketImg: UIImage
    let goalMoney:Int
    
    //초기값이 필요 없음
    let bucketMoney:Int = 0
    let dondon:[Pig] = []
    let percent:Double = 0
    
    init(bucketName:String, bucketImg:UIImage, goalMoney:Int) {
        self.bucketName = bucketName
        self.bucketImg = bucketImg
        self.goalMoney = goalMoney
    }
    
    
    
}

/**돈돈이**/
class Pig {
    let date:String //돈돈이 넣은 날짜
    let num: Int
    
    init(date:String, num:Int){
        self.date = date
        self.num = num
    }
}




