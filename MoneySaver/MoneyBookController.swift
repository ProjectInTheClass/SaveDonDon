

import UIKit
import FSCalendar

class MoneyBookController: UIViewController, UITableViewDataSource,UITableViewDelegate, FSCalendarDelegate, FSCalendarDataSource  {

    //has no initializer: 초기화 되지 않은 변수가 있을 경우에 오류 발생할 수 있음.
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var calendar: FSCalendar!
    var income = moneyPocket.income //소득이 배열로 담겨 있음
    var spend = moneyPocket.spend //지출이 배열로 담겨 있음
    let gregorian = [NSCalendar (calendarIdentifier: NSCalendar.Identifier.gregorian)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //특정 날짜를 클릭 했을 때
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
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
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      //  let info = bucket[indexPath.row]
        let cell:MoneyBookCell = tableView.dequeueReusableCell(withIdentifier: "MoneyBookCell") as! MoneyBookCell
        
        //셀에 띄울 데이터: 달력의 날짜와 맞는 수입과 지출들을 필터링해서 더한 다음 띄움
//        cell.goalName?.text = info.bucketName
//        cell.goalMoney?.text = String(info.goalMoney)+"원"
//        cell.goalImage?.image = UIImage(named: info.bucketImg)
//        cell.donMoney?.text = String(info.bucketMoney)+"원"
//        cell.donNum?.text = "X " + String(info.donNum)
        
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
