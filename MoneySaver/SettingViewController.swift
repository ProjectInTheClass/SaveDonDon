
import UIKit

class SettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        table.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unWindSettingMain(segue: UIStoryboardSegue){
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
  
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        
        if index == 0 {
         let cell:PigNameCell = tableView.dequeueReusableCell(withIdentifier: "PigNameCell") as! PigNameCell
            cell.pigNameLabel.text = moneyPocket.pigName
            return cell
        }else if index == 1 {
            let cell:DepositCell = tableView.dequeueReusableCell(withIdentifier: "DepositCell") as! DepositCell
            cell.depositLabel.text = "\(moneyPocket.deposit) 원"
            return cell
        }
        else {
            let cell:HelpCell = tableView.dequeueReusableCell(withIdentifier: "HelpCell") as! HelpCell
            cell.helpLabel.text = "버킷리스트의 완료 개수에 따라 \n돈돈이가 성장합니다.\n\n버킷리스트 0개 완료: 알 (LV1) 버킷리스트 1개 완료: 아기돼지 (LV2) 버킷리스트 5개 완료: 어린이돼지 (LV3) 버킷리스트 10개 완료: 어른돼지 (LV4) 버킷리스트 20개 완료: 황금돼지 (LV5)"
            return cell
        }
        
    }


    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
