
import Foundation

let moneyPocket: MoneyPocket = MoneyPocket(startDate: "2018.09.01", deposit: 10000)

class MoneyPocket {
    let startDate: String //시작일
    let deposit: Int //자본금
    var income: [Income]
    var spend : [Spend]
    var bucket : [Bucket]
    
    
    //앞에서 넘어온 시작 값과 자본금을 설정
    init(startDate: String, deposit:Int){
        income = []
        spend = []
        bucket = []
        self.startDate = startDate
        self.deposit = deposit
        
        
        //수입 쓰레기값(하루 수입 600000원)
        let income1 = Income(date: "2018.07.26", history: "용돈", price: 100000)
        let income2 = Income(date: "2018.07.26", history: "월급", price: 200000)
        let income3 = Income(date: "2018.07.26", history: "근로", price: 300000)
        income += [income1, income2, income3]
        
        
        //지출 쓰레기값(하루 지출 60000원)
        let spend1 = Spend(date: "2018.07.26", history: "과자", price: 10000)
        let spend2 = Spend(date: "2018.07.26", history: "빵", price: 20000)
        let spend3 = Spend(date: "2018.07.26", history: "음료수", price: 30000)
        spend += [spend1, spend2, spend3]
        
        //버킷리스트 쓰레기값
        let americaBucket = Bucket(bucketName: "미국여행",bucketImg: "미국", goalMoney: 100000, bucketMoney: 50000)
        let europeBucket =  Bucket(bucketName: "유럽여행",bucketImg: "유럽", goalMoney: 120000, bucketMoney: 30000)
        let nammiBucket = Bucket(bucketName: "남미여행", bucketImg: "남미", goalMoney: 140000, bucketMoney: 40000)
        
        bucket += [americaBucket, europeBucket, nammiBucket]
        
    }
    
}



class Income {
    let date: String
    let history: String
    let price: Int
    
    init(date: String, history: String, price:Int){
        self.date = date
        self.history = history
        self.price = price
    }
}

class Spend {
    let date: String
    let history: String
    let price: Int
    
    init(date: String, history: String, price:Int){
        self.date = date
        self.history = history
        self.price = price
    }
}



class Bucket{
    var selectedIndex = 0
    
    let bucketName:String //목표 이름
    let bucketImg:String //목표 이미지
    let goalMoney:Int //목표 돈
    let bucketMoney:Int //모은 돈
    let donNum:Int = 0 //돈돈이 개수
    let percent:Double = 0
    
    init(bucketName:String, bucketImg:String, goalMoney:Int, bucketMoney:Int) {
        self.bucketName = bucketName
        self.bucketImg = bucketImg
        self.goalMoney = goalMoney
        self.bucketMoney = bucketMoney
    }
    
}


