
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
