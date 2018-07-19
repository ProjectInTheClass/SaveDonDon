//
//  BuckTableViewController.swift
//  MoneySaver
//
//  Created by 홍정민 on 2018. 7. 19..
//  Copyright © 2018년 홍정민. All rights reserved.
//

import Foundation
import UIKit

class BucketTableViewController:UITableViewController{
    let modelBucket = BucketModel()
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.modelBucket.arrayList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let info = modelBucket.arrayList[indexPath.row]
        let cell:BucketCell = tableView.dequeueReusableCell(withIdentifier: "BucketCell") as! BucketCell
        cell.goalName.text = info.goalName
        cell.goalMoney.text = String(info.goalMoney)
        cell.goalImage.image = UIImage(named: info.goalImg)
        cell.donMoney.text = String(info.donMoney)
        cell.donNum.text = String(info.donNum)
    
        return cell
    }
    
    
}
