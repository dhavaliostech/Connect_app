//
//  ChatListVC.swift
//  IeUK_Connect
//
//  Created by PS on 16/10/18.
//  Copyright © 2018 PS. All rights reserved.
//

import UIKit
import XLPagerTabStrip
class ChatListVC: UIViewController,IndicatorInfoProvider {

    var isConnection:Bool!
    
    var info :IndicatorInfo = IndicatorInfo(title: "Connect", accessibilityLabel: "Connect", image: #imageLiteral(resourceName: "icnChat"), highlightedImage: #imageLiteral(resourceName: "icnSelectChat"), userInfo: "Connect")
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return info
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
extension ChatListVC:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
            return 4
       
       
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
            let cell = tableView.dequeueReusableCell(withIdentifier: "ConnectListCell") as! ConnectListCell
            cell.selectionStyle = .none
            cell.backView.layer.shadowOpacity = 0.20
            cell.backView.layer.shadowOffset = CGSize(width: 0, height: 4)
            cell.backView.layer.shadowRadius = 2
            cell.backView.layer.shadowColor = UIColor.black.cgColor//UIColor.init(red: 189.0/255, green: 193.0/255, blue: 194/255, alpha: 0.25).cgColor
            cell.backView.layer.masksToBounds = false
            cell.backView.layer.cornerRadius = 8
            if indexPath.row == 3{
                cell.lblCount.isHidden = false
                cell.lblCount.layer.cornerRadius = cell.lblCount.frame.size.height/2
                cell.lblCount.clipsToBounds = true
                cell.lblTIme.textColor = UIColor(red:35/255 , green: 40/255, blue: 86/255, alpha: 1)
            }else {
                cell.lblCount.isHidden = true
            }
            return cell
       
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "ChatVC") as! ChatVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
