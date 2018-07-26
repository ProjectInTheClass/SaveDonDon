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
    var incomeIndex: [Int] = [] //filter해서 얻은 값이 원래 배열의 어디에 있는 값인지 알기 위해 사용
    var spendIndex: [Int] = []
    var income:[Income] = [] //소득이 배열로 담겨 있음(바뀐 소득 배열을 업데이트 시켜주기 위해)
    var spend: [Spend] = [] //지출이 배열로 담겨 있음
    
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
            todayIncomeArray.remove(at:indexPath.row) //데이터 삭제
            income.remove(at: incomeIndex[indexPath.row])
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            }
        }
        else if indexPath.section == 1 {
            if editingStyle == UITableViewCellEditingStyle.delete{
                todaySpendArray.remove(at:indexPath.row)
                //화면에 보여주는 오늘의 지출 삭제(but 전 화면에 영향x, 전 화면의 income과 spend를 업데이트 하면 연관된 오늘의 지출, 수입이 업데이트 됨)
                spend.remove(at: spendIndex[indexPath.row]) //filter된 곳의 index 위치의 값을 지움
                tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //연결된 세그가 테이블에서 연결된 편집창
        if segue.identifier == "CheckBackSegue" {
            let moneyBookVC = segue.destination as! MoneyBookController
            moneyBookVC.income = self.income
            moneyBookVC.spend = self.spend
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
