//
//  NotificationVC.swift
//  IeUK_Connect
//
//  Created by PS on 15/10/18.
//  Copyright © 2018 PS. All rights reserved.
//

import UIKit
import XLPagerTabStrip
class NotificationVC: UIViewController,IndicatorInfoProvider {
    
    @IBOutlet var tblNotification: UITableView!
    var isConnection:Bool!
   
    var info : IndicatorInfo = IndicatorInfo(title: "Notification", accessibilityLabel: "Notification", image: #imageLiteral(resourceName: "icnNotification"), highlightedImage: #imageLiteral(resourceName: "icnSelectNotification"), userInfo: "Notification")
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return info
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.perform(#selector(self.refresh), with: nil, afterDelay: 0.05)
        
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
       

    }
    @objc func refresh () {
        self.tblNotification.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
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
extension  NotificationVC:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationCell") as! NotificationCell
        DispatchQueue.main.async {
            let path = UIBezierPath(roundedRect:cell.eventImages.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 8, height: 8))
            let maskLayer = CAShapeLayer()
            maskLayer.frame = cell.eventImages.bounds
            maskLayer.path = path.cgPath
            cell.eventImages.layer.mask = maskLayer
        }
      
       
        cell.selectionStyle = .none
        
        cell.backView.layer.shadowOpacity = 0.20
        cell.backView.layer.shadowOffset = CGSize(width: 0, height: 4)
        cell.backView.layer.shadowRadius = 2
        cell.backView.layer.shadowColor = UIColor.black.cgColor//UIColor.init(red: 189.0/255, green: 193.0/255, blue: 194/255, alpha: 0.25).cgColor
        cell.backView.layer.masksToBounds = false
        cell.backView.layer.cornerRadius = 10
        
        
       //cell.backView.clipsToBounds = true
       
        //self.tblNotification.reloadData()
        
        return cell
    }
}
