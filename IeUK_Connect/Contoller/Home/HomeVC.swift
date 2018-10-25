//
//  HomeVC.swift
//  IeUK_Connect
//
//  Created by PS on 16/10/18.
//  Copyright © 2018 PS. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import SideMenu
class HomeVC: BaseButtonBarPagerTabStripViewController<YoutubeIconWithLabelCell>,UIViewControllerTransitioningDelegate {
    
    @IBOutlet var buttonBackView: UIView!
    var isConnection:Bool!
    var isChat:Bool!
    
    let redColor = UIColor.init(red: 35/255, green: 40/255, blue: 86/255, alpha: 1)
    let unselectedIconColor = UIColor.init(red: 156/255, green: 160/255, blue: 183/255, alpha: 1)
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        buttonBarItemSpec = ButtonBarItemSpec.nibFile(nibName: "YoutubeIconWithLabelCell", bundle: Bundle(for: YoutubeIconWithLabelCell.self), width: { _ in
            return 80.0
        })
    }

    override public func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {

        let vc1 = self.storyboard?.instantiateViewController(withIdentifier: "NotificationVC") as! NotificationVC
        vc1.isConnection = self.isConnection
        let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "ChatListVC") as! ChatListVC
        let vc3 = self.storyboard?.instantiateViewController(withIdentifier: "ConnectionReqVC") as! ConnectionReqVC
        vc3.isConnection = self.isConnection
        
        if self.isConnection == true{
            return [vc1,vc3]
        }else{
            return [vc1,vc2]
        }
        
   }
    

    override func viewDidLoad() {
        

        settings.style.buttonBarItemBackgroundColor = .clear //UIColor.init(red: 223/255, green: 223/255, blue: 223/255, alpha: 1)
        settings.style.selectedBarBackgroundColor = UIColor.clear
        settings.style.buttonBarBackgroundColor = UIColor.white
        settings.style.buttonBarItemBackgroundColor = UIColor.white
       // settings.style.buttonBarItemFont = UIFont(name: "SFUIDisplay-Medium", size: 17)!
        //settings.style.buttonBarItemFont = UIFont.boldSystemFont(ofSize: 16.0)
        settings.style.buttonBarItemFont = UIFont.systemFont(ofSize: 17.0)
        settings.style.selectedBarHeight = 1
        settings.style.buttonBarMinimumLineSpacing = 0
       
        settings.style.buttonBarItemTitleColor = UIColor.gray//init(displayP3Red: 9/255.0, green: 25/255.0, blue: 50/255.0, alpha: 1)
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        
        changeCurrentIndexProgressive = { [weak self] (oldCell: YoutubeIconWithLabelCell?, newCell: YoutubeIconWithLabelCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            //oldCell?.iconImage.tintColor = self?.unselectedIconColor
            
        
            //newCell?.iconImage.tintColor = .white
            if newCell?.iconLabel.text == "Notification"{
                newCell?.iconImage.image = #imageLiteral(resourceName: "icnSelectNotification")
            }else{
                newCell?.iconImage.image = #imageLiteral(resourceName: "icnSelectChat")
            }
            if oldCell?.iconLabel.text == "Notification"{
                oldCell?.iconImage.image = #imageLiteral(resourceName: "icnNotification")
            }else {
                oldCell?.iconImage.image = #imageLiteral(resourceName: "icnChat")
            }
            oldCell?.iconLabel.textColor = UIColor.init(red: 156/255, green: 160/255, blue: 183/255, alpha: 1)
            newCell?.iconLabel.textColor = UIColor.init(red: 35/255, green: 40/255, blue: 86/255, alpha: 1)
        }
        self.view.setNeedsLayout()
        super.viewDidLoad()
        SideMenuManager.default.menuWidth =  300
        SideMenuManager.default.menuPresentMode = .menuSlideIn
        SideMenuManager.default.menuRightSwipeToDismissGesture?.accessibilityViewIsModal = false
        //SideMenuManager.default.menuLeftNavigationController?.preferredStatusBarStyle = .lightContent
        
        if self.isChat == true{
            self.perform(#selector(self.moveToVC), with: nil, afterDelay: 0.05)
        }else {
            
        }
        
        self.buttonBarView.layer.shadowOpacity = 0.60
        self.buttonBarView.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.buttonBarView.layer.shadowRadius = 2
        self.buttonBarView.layer.shadowColor = UIColor.black.cgColor
        self.buttonBarView.layer.masksToBounds = false
        self.buttonBarView.clipsToBounds = false
        // Do any additional setup after loading the view.
    }
    @objc func moveToVC () {
         self.moveToViewController(at: 1)
    }
    override func viewWillAppear(_ animated: Bool) {
       
        
       
    }
    override func viewDidAppear(_ animated: Bool) {
       
    }
    override func configure(cell: YoutubeIconWithLabelCell, for indicatorInfo: IndicatorInfo) {
        if indicatorInfo.image == #imageLiteral(resourceName: "icnSelectNotification"){
            cell.iconImage.image = #imageLiteral(resourceName: "icnSelectNotification")
            
        }else if indicatorInfo.image == #imageLiteral(resourceName: "icnNotification"){
            cell.iconImage.image = #imageLiteral(resourceName: "icnNotification")
        }else if indicatorInfo.image == #imageLiteral(resourceName: "icnSelectChat") {
            cell.iconImage.image = #imageLiteral(resourceName: "icnSelectChat")
        }else if indicatorInfo.image == #imageLiteral(resourceName: "icnChat"){
            cell.iconImage.image = #imageLiteral(resourceName: "icnChat")
        }
        
        cell.iconLabel.text = indicatorInfo.title
    }

    @IBAction func btnAddRequsetaction(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "SearchVC") as! SearchVC
        vc.transitioningDelegate = self
        vc.modalPresentationStyle = .custom
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func btnMenuaction(_ sender: UIButton) {
        //SideMenuVC
//        let vc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "UISideMenuNavigationController") as! UISideMenuNavigationController
//        vc.transitioningDelegate = self
//        vc.modalPresentationStyle = .custom
//        self.present(vc, animated: true, completion: nil)
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
