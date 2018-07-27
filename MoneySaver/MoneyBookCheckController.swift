//
//  TableViewController.swift
//  MoneySaver
//
//  Created by 홍정민 on 2018. 7. 26..
//  Copyright © 2018년 홍정민. All rights reserved.
//

import UIKit

class MoneyBookCheckController: UITableViewController {
    var todayIncomeArray: [Income] = [] //전체 income에서 해당날짜 수입만 모은 배열
    var todaySpendArray: [Spend] = [] //전제 spend에서 해당날짜 지출만 모은 배열
    var selectedDate:String!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(selectedDate)
        dateLabel!.text = selectedDate
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowCount = 0
        if section == 0 { rowCount = todayIncomeArray.count }
        else if section == 1 {rowCount = todaySpendArray.count }
        
        return rowCount
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : MoneyBookCheckCell = tableView.dequeueReusableCell(withIdentifier: "MoneyBookCheckCell", for: indexPath) as! MoneyBookCheckCell
        
        //3자리씩 끊어서 콤마
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        var priceText:String!
        
        if(indexPath.section == 0 ){
            let value = todayIncomeArray
            
            if(value[indexPath.row].mc == "현금")
            {
                cell.mcImg?.image = UIImage(named: "현금")
                
            } else {
                cell.mcImg?.image = UIImage(named: "카드")
            }
            
            cell.typeImg?.image = UIImage(named: "pig")
            cell.historyLabel?.text = String(value[indexPath.row].history)
            priceText = numberFormatter.string(from: NSNumber(value: value[indexPath.row].price))! + " 원"
            cell.priceLabel?.text = priceText
        } else{
            let value = todaySpendArray
           
            if(value[indexPath.row].mc == "현금")
            {
                cell.mcImg?.image = UIImage(named: "현금")
                
            } else {
                cell.mcImg?.image = UIImage(named: "카드")
            }
            
            cell.typeImg?.image = UIImage(named: "pig")
            cell.historyLabel?.text = String(value[indexPath.row].history)
            priceText = numberFormatter.string(from: NSNumber(value: value[indexPath.row].price))! + " 원"
            cell.priceLabel?.text = priceText }
        
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var sectionTitle:String = ""
        
        if section == 0
        { sectionTitle = "수입"
        } else if section == 1{
            sectionTitle = "지출"
        }
        return sectionTitle
    }
    
    

    //스와이프해서 삭제
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {

        if indexPath.section == 0 {
        if editingStyle == UITableViewCellEditingStyle.delete{
            if let index = moneyPocket.income.index(of:todayIncomeArray[indexPath.row]) {
               moneyPocket.income.remove(at: index)
            }
            self.todayIncomeArray.remove(at:indexPath.row) //데이터 삭제
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            }
        }
        else if indexPath.section == 1 {
            if editingStyle == UITableViewCellEditingStyle.delete{
                if let index = moneyPocket.spend.index(of:todaySpendArray[indexPath.row]) {
                    moneyPocket.spend.remove(at: index)
                }
                self.todaySpendArray.remove(at:indexPath.row)
               
                tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //연결된 세그가 테이블에서 연결된 편집창
        if segue.identifier == "CheckBackSegue" {
            let moneyBookVC = segue.destination as! MoneyBookController
            print(todayIncomeArray)
            print(moneyPocket.income)
            moneyBookVC.income = moneyPocket.income
            moneyBookVC.spend = moneyPocket.spend
            moneyBookVC.newDiff()
        }
    }
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
   
    
}
