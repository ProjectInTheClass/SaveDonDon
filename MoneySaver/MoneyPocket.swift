
import Foundation
import UIKit

var moneyPocket: MoneyPocket = MoneyPocket()
let pigNameFile = "pigName.file"
let depositFile = "deposit.file"
let incomeFile = "income.file"
let spendFile = "spend.file"
let bucketFile = "bucket.file"



class MoneyPocket {
    var pigName: String = "돈돈이"
    var deposit: Int = 0
    var income: [Income] = []
    var spend : [Spend] = []
    var bucket : [Bucket] = []

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
    
    
    var pigNamePath:String { get{
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!

        return documentDirectory + "/" + pigNameFile
        }}
    
    var depositPath:String { get{
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        return documentDirectory + "/" + depositFile
        }}
    
    var incomePath:String { get{
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        return documentDirectory + "/" + incomeFile
        }}
    
    var spendPath:String { get{
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        return documentDirectory + "/" + spendFile
        }}
    
    var bucketPath:String { get{
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        return documentDirectory + "/" + bucketFile
        }}
    
    init() {
        
        //pigName
        if FileManager.default.fileExists(atPath: self.pigNamePath) {
            if let pigName = NSKeyedUnarchiver.unarchiveObject(withFile: self.pigNamePath) as? String {
                self.pigName = pigName
        }
        }
        
        //deposit
        if FileManager.default.fileExists(atPath: self.depositPath) {
            if let deposit = NSKeyedUnarchiver.unarchiveObject(withFile: self.depositPath) as? Int {
                self.deposit = deposit
            }
        }
        
        //income
        if FileManager.default.fileExists(atPath: self.depositPath) {
            if let income = NSKeyedUnarchiver.unarchiveObject(withFile: self.incomePath) as? [Income] {
                self.income += income
            }
        }else {
            let income1 = Income(date: "2018.07.26",mc: "카드", history: "용돈", price: 100000)
            let income2 = Income(date: "2018.07.26",mc: "현금", history: "월급", price: 100000)
            let income3 = Income(date: "2018.07.26",mc: "카드", history: "근로", price: 100000)
            let income4 = Income(date: "2018.07.26",mc: "현금", history: "일급", price: 100000)
            income += [income1, income2, income3, income4]
        }
                
        
        //spend
        if FileManager.default.fileExists(atPath: self.spendPath) {
            if let spend = NSKeyedUnarchiver.unarchiveObject(withFile: self.spendPath) as? [Spend] {
                self.spend += spend
            }
        }else {
            let spend1 = Spend(date: "2018.07.26",mc: "카드", history: "과자", price: 10000)
            let spend2 = Spend(date: "2018.07.26",mc: "현금", history: "빵", price: 10000)
            let spend3 = Spend(date: "2018.07.26",mc: "카드", history: "음료수", price: 10000)
            let spend4 = Spend(date: "2018.07.26",mc: "현금", history: "오징어", price: 10000)
            spend += [spend1, spend2, spend3, spend4]
        }
        
        
        //bucket
        if FileManager.default.fileExists(atPath: self.spendPath) {
            if let bucket = NSKeyedUnarchiver.unarchiveObject(withFile: self.bucketPath) as? [Bucket] {
                self.bucket += bucket
            }
        }else {
            let americaBucket = Bucket(bucketName: "미국여행",bucketImg: UIImage(named: "미국")!, goalMoney: 1000000)
            let europeBucket =  Bucket(bucketName: "유럽여행",bucketImg: UIImage(named: "유럽")!, goalMoney: 10000)
            let nammiBucket = Bucket(bucketName: "남미여행", bucketImg: UIImage(named: "남미")!, goalMoney: 10000)
            let europeBucket2 =  Bucket(bucketName: "유럽여행",bucketImg: UIImage(named: "유럽")!, goalMoney: 10000)
            let nammiBucket2 = Bucket(bucketName: "남미여행", bucketImg: UIImage(named: "남미")!, goalMoney: 10000)
            
            let europeBucket3 =  Bucket(bucketName: "유럽여행",bucketImg: UIImage(named: "유럽")!, goalMoney: 10000)
            let nammiBucket3 = Bucket(bucketName: "남미여행", bucketImg: UIImage(named: "남미")!, goalMoney: 10000)
            
            let europeBucket4 =  Bucket(bucketName: "유럽여행",bucketImg: UIImage(named: "유럽")!, goalMoney: 10000)
            let nammiBucket4 = Bucket(bucketName: "남미여행", bucketImg: UIImage(named: "남미")!, goalMoney: 10000)
            
            let europeBucket5 =  Bucket(bucketName: "유럽여행",bucketImg: UIImage(named: "유럽")!, goalMoney: 10000)
            let nammiBucket5 = Bucket(bucketName: "남미여행", bucketImg: UIImage(named: "남미")!, goalMoney: 10000)
            let europeBucket6 =  Bucket(bucketName: "유럽여행",bucketImg: UIImage(named: "유럽")!, goalMoney: 10000)
            let nammiBucket6 = Bucket(bucketName: "남미여행", bucketImg: UIImage(named: "남미")!, goalMoney: 10000)
            let europeBucket7 =  Bucket(bucketName: "유럽여행",bucketImg: UIImage(named: "유럽")!, goalMoney: 10000)
            let nammiBucket7 = Bucket(bucketName: "남미여행", bucketImg: UIImage(named: "남미")!, goalMoney: 10000)
            let europeBucket8 =  Bucket(bucketName: "유럽여행",bucketImg: UIImage(named: "유럽")!, goalMoney: 10000)
            let nammiBucket8 = Bucket(bucketName: "남미여행", bucketImg: UIImage(named: "남미")!, goalMoney: 10000)
            let europeBucket9 =  Bucket(bucketName: "유럽여행",bucketImg: UIImage(named: "유럽")!, goalMoney: 10000)
            let nammiBucket9 = Bucket(bucketName: "남미여행", bucketImg: UIImage(named: "남미")!, goalMoney: 10000)
            let europeBucket10 =  Bucket(bucketName: "유럽여행",bucketImg: UIImage(named: "유럽")!, goalMoney: 10000)
            let nammiBucket10 = Bucket(bucketName: "남미여행", bucketImg: UIImage(named: "남미")!, goalMoney: 10000)
            bucket += [americaBucket, europeBucket, nammiBucket, europeBucket2, nammiBucket2, europeBucket3, nammiBucket3, europeBucket4, nammiBucket4, europeBucket5, nammiBucket5, europeBucket6, nammiBucket6, europeBucket7,nammiBucket7, nammiBucket8, europeBucket8, nammiBucket9, europeBucket9, nammiBucket10, europeBucket10 ]
        }
        
        
 }
    
    func save(){
         NSKeyedArchiver.archiveRootObject(self.income, toFile: self.incomePath)
         NSKeyedArchiver.archiveRootObject(self.spend, toFile: self.spendPath)
         NSKeyedArchiver.archiveRootObject(self.bucket, toFile: self.bucketPath)
         NSKeyedArchiver.archiveRootObject(self.deposit, toFile: self.depositPath)
         NSKeyedArchiver.archiveRootObject(self.pigName, toFile: self.pigNamePath)
    }

}






 class Income : NSObject, NSCoding {
    static func == (lhs: Income, rhs: Income) -> Bool {
        return lhs.timeStamp == rhs.timeStamp
    }
    
    let timeStamp = Date().timeIntervalSince1970
    
    let date: String
    let mc : String
    let history: String
    let price: Int
    
    required init?(coder aDecoder: NSCoder) {
        self.date = aDecoder.decodeObject(forKey: "incomeDate") as! String
        self.mc = aDecoder.decodeObject(forKey: "incomeMc") as! String
        self.history = aDecoder.decodeObject(forKey: "incomeHistory") as! String
        if let value = aDecoder.decodeObject(forKey: "incomePrice") as? Int {
            self.price = value
        }
        else {
            self.price = 0
        }
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.date, forKey: "incomeDate")
        aCoder.encode(self.mc, forKey: "incomeMc")
        aCoder.encode(self.history, forKey: "incomeHistory")
        aCoder.encode(self.price, forKey: "incomePrice")

    }
    
    init(date: String, mc: String, history: String, price:Int){
        self.date = date
        self.mc = mc
        self.history = history
        self.price = price
    }
}

 class Spend: NSObject, NSCoding {
    
    static func == (lhs: Spend, rhs: Spend) -> Bool{
        return lhs.timeStamp == rhs.timeStamp
    }

    let timeStamp = Date().timeIntervalSince1970
    
    let date: String
    let mc : String
    let history: String
    let price: Int
    var bucketIndex: Int = -1

    required init?(coder aDecoder: NSCoder) {
        self.date = aDecoder.decodeObject(forKey: "spendDate") as! String
        self.mc = aDecoder.decodeObject(forKey: "spendMc") as! String
        self.history = aDecoder.decodeObject(forKey: "spendHistory") as! String
        if let value = aDecoder.decodeObject(forKey: "spendPrice") as? Int {
            self.price = value
        }else {
            self.price = 0
        }
        if let index = aDecoder.decodeObject(forKey: "spendIndex") as? Int {
            self.bucketIndex = index
        }else {
            self.bucketIndex = -1
        }
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.date, forKey: "spendDate")
        aCoder.encode(self.mc, forKey: "spendMc")
        aCoder.encode(self.history, forKey: "spendHistory")
        aCoder.encode(self.price, forKey: "spendPrice")
        aCoder.encode(self.price, forKey: "spendIndex")
    }
    
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



    class Bucket: NSObject, NSCoding {
        
    static func == (lhs: Bucket, rhs: Bucket) -> Bool{
        return lhs.timeStamp == rhs.timeStamp
    }
    
    
    let timeStamp = Date().timeIntervalSince1970
    let bucketName:String
    let bucketImg: UIImage
        var goalMoney:Int
    var dondonMoney:Int = 0
   
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
        if self.dondonMoney == self.goalMoney { return 1 }
        else { return 0 }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        self.bucketName = aDecoder.decodeObject(forKey: "bucketName") as! String
        self.bucketImg = aDecoder.decodeObject(forKey: "bucketImg") as! UIImage
        self.goalMoney = aDecoder.decodeInteger(forKey: "donMoney")
        self.goalMoney = aDecoder.decodeInteger(forKey: "goalMoney")
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.bucketName, forKey: "bucketName")
        aCoder.encode(self.bucketImg, forKey: "bucketImg")
        aCoder.encode(self.goalMoney, forKey: "goalMoney")
        aCoder.encode(self.dondonMoney, forKey: "donMoney")
    }

    
    init(bucketName:String, bucketImg:UIImage, goalMoney:Int) {
        self.bucketName = bucketName
        self.bucketImg = bucketImg
        self.goalMoney = goalMoney //터ㅓ져
        self.dondonMoney = 0 //터져 int
    }
    
}






