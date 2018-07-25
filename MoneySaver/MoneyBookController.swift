

import Foundation
import UIKit
import FSCalendar

class MoneyBookController: UIViewController, UITableViewDataSource, UITableViewDelegate, FSCalendarDataSource, FSCalendarDelegate {

    //해당 뷰 누르고 컨트롤러로 delegate랑 datasource연결 해준 다음 컨트롤러에 implement한다.
    //has no initializer: 초기화 되지 않은 변수가 있을 경우에 오류 발생할 수 있음.

    @IBOutlet weak var calendar: FSCalendar!
    
    @IBOutlet weak var table: UITableView!
    var income = moneyPocket.income //소득이 배열로 담겨 있음
    var spend = moneyPocket.spend //지출이 배열로 담겨 있음
    let date = NSDate()
    let formatter = DateFormatter()
    var selectedDate = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.scrollDirection = .vertical
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
    //뒤에서 여기로 돌아오는 세그
    @IBAction func unwindMoneyBookSegue(segue:UIStoryboardSegue){
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
      return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 //오늘의 수입, 지출만 보여줌
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
     selectedDate = formatter.string(from: date as Date) //캘린더에서 선택한 날짜 받아오기
        table.reloadData()
    }
    
    //안ㅁ거어
    
    //cell 리턴
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MoneyBookCell = tableView.dequeueReusableCell(withIdentifier: "MoneyBookCell", for: indexPath) as! MoneyBookCell
        
        formatter.dateFormat = "yyyy.MM.dd"
        var tableDate:String = selectedDate
        
        if tableDate == ""{
            tableDate = formatter.string(from: date as Date)
        }
        
        cell.todaysDate!.text = tableDate
        cell.totalIncome!.text = "100000"
        cell.totalSpend!.text = "50000"
        
        return cell
    }
    
   
    
    
    // MARK: - Table view data source



    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
