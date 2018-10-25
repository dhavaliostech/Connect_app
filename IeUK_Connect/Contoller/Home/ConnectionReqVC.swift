//
//  ConnectionReqVC.swift
//  IeUK_Connect
//
//  Created by PS on 19/10/18.
//  Copyright © 2018 PS. All rights reserved.
//

import UIKit
import XLPagerTabStrip
class ConnectionReqVC: UIViewController,IndicatorInfoProvider {

    var isConnection:Bool!
    @IBOutlet var tblConnectionList: UITableView!
    var info :IndicatorInfo = IndicatorInfo(title: "Connect", accessibilityLabel: "Connect", image: #imageLiteral(resourceName: "icnChat"), highlightedImage: #imageLiteral(resourceName: "icnSelectChat"), userInfo: "Connect")
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return info
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        if self.isConnection == true{
//            let change = parent as! HomeVC
//            change.isConnection = false
//            change.isChat = false
//            
//        }
    }
    override func viewDidDisappear(_ animated: Bool) {
       
    }
    override func viewWillDisappear(_ animated: Bool) {
       
        if self.isConnection == true{
            let change = parent as! HomeVC
            change.isConnection = false
            change.isChat = false
            DispatchQueue.main.async {
                change.viewDidLoad()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
extension ConnectionReqVC:UITableViewDelegate
,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConnectionRequestCell") as! ConnectionRequestCell
        
        cell.backView.layer.shadowOpacity = 0.20
        cell.backView.layer.shadowOffset = CGSize(width: 0, height: 4)
        cell.backView.layer.shadowRadius = 2
        cell.backView.layer.shadowColor = UIColor.black.cgColor//UIColor.init(red: 189.0/255, green: 193.0/255, blue: 194/255, alpha: 0.25).cgColor
        cell.backView.layer.masksToBounds = false
        cell.backView.layer.cornerRadius = 8
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
