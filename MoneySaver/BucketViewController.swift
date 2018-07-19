//
//  SimpleViewController.swift
//  MoneySaver
//
//  Created by 홍정민 on 2018. 7. 19..
//  Copyright © 2018년 홍정민. All rights reserved.
//

import Foundation
import UIKit

//Scene의 기본역할 + 데이터소스(로우, 섹션의 개수)
class BucketViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
   
    @IBOutlet weak var table: UITableView!
    
    let modelBucket = BucketModel()
    
    
    //section의 개수
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //row의 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.modelBucket.arrayList.count
    }
    
    
    //cell 리턴
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let info = modelBucket.arrayList[indexPath.row]
        let cell:BucketCell = tableView.dequeueReusableCell(withIdentifier: "BucketCell") as! BucketCell
        cell.goalName.text = info.goalName
        cell.goalMoney.text = String(info.goalMoney)
        cell.goalImage.image = UIImage(named: info.goalImg)
        cell.donMoney.text = String(info.donMoney)
        cell.donNum.text = String(info.donNum)
        
        return cell
    }
    
    //스와이프해서 삭제
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete{
            self.modelBucket.arrayList.remove(at:indexPath.row) //데이터 삭제
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    
    //다음 창으로 넘어갈 때
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! BucketCell //내가 누른 셀
        let indexPath:IndexPath = table.indexPath(for: cell)! //내가 누른 셀의 indexPath
        self.modelBucket.selectedIndex = indexPath.row //누른 곳의 인덱스를 indexPath.row로
        let bucketSetting = segue.destination as! BucketSettingController //목적지는 버킷리스트 세팅창
        bucketSetting.modelBucket = self.modelBucket //bucketSetting으로 modelbucket넘겨줌
    }
    
    
    
}
