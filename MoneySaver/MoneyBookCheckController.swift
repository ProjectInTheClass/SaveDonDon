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
    
    //수입 지출 구분해서 출력할건지 합쳐서 정렬해서 할건지 결정
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
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
