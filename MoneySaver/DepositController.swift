//
//  DepositController.swift
//  MoneySaver
//
//  Created by 홍정민 on 2018. 8. 1..
//  Copyright © 2018년 홍정민. All rights reserved.
//

import UIKit

class DepositController: UIViewController {
    @IBOutlet weak var depositText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        depositText.text = String(moneyPocket.deposit)
        depositText.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "DepositSaveSegue" {
            let deposit = depositText.text!
            if deposit.isEmpty {
                let alert = UIAlertController(title: "자본금 저장 불가", message: "값을 입력해주세요", preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: UIAlertActionStyle.default)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
                return false
            }else {
                moneyPocket.deposit = Int(deposit)!
                moneyPocket.save()
                return true }
        }
        return true
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
