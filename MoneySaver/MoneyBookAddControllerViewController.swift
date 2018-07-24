//
//  MoneyBookAddControllerViewController.swift
//  MoneySaver
//
//  Created by 홍정민 on 2018. 7. 24..
//  Copyright © 2018년 홍정민. All rights reserved.
//

import UIKit
import DLRadioButton

class MoneyBookAddControllerViewController: UIViewController {
    
    @IBOutlet weak var historyText: UITextField!
    @IBOutlet weak var priceText: UITextField!
    var typeString:String?
    
    @IBAction func typeSelect(_ sender: DLRadioButton) {
        if(sender.currentTitle == "수입"){
            typeString = "수입"
        }
        else{
            typeString = "지출"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    /**수입 추가**/
    func addIncome() -> Income? {
        let history:String = historyText.text!
        let price:Int = Int(priceText.text!)!
        let date = NSDate()
        let formatter = DateFormatter() //날짜 띄우는 포맷
        formatter.dateFormat = "yyyy.MM.dd" //포맷 지정
        let dateString = formatter.string(from: date as Date)
        
        return Income(date: dateString, history: history, price: price)
    }
    
    /**지출 추가**/
    func addSpend() -> Spend? {
        let history:String = historyText.text!
        let price:Int = Int(priceText.text!)!
        let date = NSDate()
        let formatter = DateFormatter() //날짜 띄우는 포맷
        formatter.dateFormat = "yyyy.MM.dd" //포맷 지정
        let dateString = formatter.string(from: date as Date)
        
        return Spend(date: dateString, history: history, price: price)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddSaveSegue" {
            switch typeString{
            case "수입":
                guard let income = addIncome(), let moneyVC = segue.destination as? MoneyBookController
                    else{ return }
                moneyVC.income += [income]
            case "지출":
                guard let spend = addSpend(), let moneyVC = segue.destination as? MoneyBookController
                    else{ return }
                moneyVC.spend += [spend]
            default:
                return
            }
        }
        
    }
    
}
