
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
                self.income = income
            }
        }
        
        
        //spend
        if FileManager.default.fileExists(atPath: self.spendPath) {
            if let spend = NSKeyedUnarchiver.unarchiveObject(withFile: self.spendPath) as? [Spend] {
                self.spend = spend
            }
        }
        
        //bucket
        if FileManager.default.fileExists(atPath: self.spendPath) {
            if let bucket = NSKeyedUnarchiver.unarchiveObject(withFile: self.bucketPath) as? [Bucket] {
                self.bucket = bucket
            }
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
        self.price = aDecoder.decodeInteger(forKey: "incomePrice")
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
        self.price = aDecoder.decodeInteger(forKey: "spendPrice")
        self.bucketIndex = aDecoder.decodeInteger(forKey: "spendIndex")

    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.date, forKey: "spendDate")
        aCoder.encode(self.mc, forKey: "spendMc")
        aCoder.encode(self.history, forKey: "spendHistory")
        aCoder.encode(self.price, forKey: "spendPrice")
        aCoder.encode(self.bucketIndex, forKey: "spendIndex")
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
        self.bucketName =  aDecoder.decodeObject(forKey: "bucketName") as! String
        self.bucketImg = aDecoder.decodeObject(forKey: "bucketImg") as! UIImage
        self.goalMoney = aDecoder.decodeInteger(forKey: "goalMoney")
        self.dondonMoney = aDecoder.decodeInteger(forKey: "donMoney")
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.bucketName, forKey: "bucketName")
        aCoder.encode(self.bucketImg, forKey: "bucketImg")
        aCoder.encode(self.goalMoney, forKey: "goalMoney")
        aCoder.encode(self.dondonMoney, forKey: "donMoney")
    }
    
    
    override var description: String {
        return "\(self.bucketName) goal : \(self.goalMoney) don: \(self.dondonMoney)"
    }
    
    init(bucketName:String, bucketImg:UIImage, goalMoney:Int) {
        self.bucketName = bucketName
        self.bucketImg = bucketImg
        self.goalMoney = goalMoney //터ㅓ져
        self.dondonMoney = 0 //터져 int
    }
    
}






