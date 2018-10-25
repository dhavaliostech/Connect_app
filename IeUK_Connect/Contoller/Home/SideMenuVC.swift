//
//  SideMenuVC.swift
//  IeUK_Connect
//
//  Created by PS on 17/10/18.
//  Copyright © 2018 PS. All rights reserved.
//

import UIKit
import SideMenu

class SideMenuVC: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet var tblList: UITableView!
    var imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        imagePicker.delegate = self
        UIApplication.shared.statusBarStyle = .lightContent
        UINavigationBar.appearance().backgroundColor = UIColor.white
        
        SideMenuManager.default.menuPresentMode = .menuSlideIn
        SideMenuManager.default.menuPresentingViewControllerUserInteractionEnabled = false
        
        
        
        // Do any additional setup after loading the view.
    }

    @IBAction func btnLogoutaction(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func takePhoto(){
        let actionSheet = UIAlertController(title: "Choose Image option", message: nil, preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { (action) in
            
            if(UIImagePickerController.isSourceTypeAvailable(.camera)){
               
                self.imagePicker.sourceType = .camera
                self.imagePicker.allowsEditing = true
                
                
                //self.present(self.imagePicker, animated: true, completion: nil)
                self.present(self.imagePicker, animated: true, completion: nil)
                
            }
            else {
                
                let alertView = UIAlertController(title: "Camera Not Available", message: "Please use a device which is capable to take a picture", preferredStyle: .alert)
                alertView.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                    
                }))
                
                self.present(alertView, animated: true, completion: nil)
            }
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Choose Photo", style: .default, handler: { (action) in
            
            if(UIImagePickerController.isSourceTypeAvailable(.photoLibrary)){
               
                self.imagePicker.sourceType = .photoLibrary
                self.imagePicker.allowsEditing = true
                
                self.parent?.present(self.imagePicker, animated: true, completion: nil)
                
                
                
            }
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (action) in
            actionSheet.dismiss(animated: true, completion: nil)
            
        }))

        
        self.parent?.present(actionSheet, animated: true, completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            let cell = tblList.cellForRow(at: IndexPath(item:0 , section: 0)) as! SideMenuCell
            cell.userProfile.image = pickedImage
            
            //self.imagePicker.dismiss(animated: true, completion: nil)
            self.dismiss(animated: true, completion: nil)
             
            
        }else{
            
            //self.imagePicker.dismiss(animated: true, completion: nil)
            self.dismiss(animated: true, completion: nil)
            
        }
        
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.imagePicker.dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnChangePhotoaction(_ sender: UIButton) {
        takePhoto()
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
extension SideMenuVC:UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }else if section == 1{
            return 4
        }else if section == 2{
            return 1
        }else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCell") as! SideMenuCell
           cell.backView.layer.cornerRadius = 8
            cell.backView.clipsToBounds = true
            cell.backView.layer.masksToBounds = true
            cell.selectionStyle = .none
            cell.userProfile.layer.cornerRadius = 10
            cell.userProfile.clipsToBounds = true
            return cell
        }else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuListCell") as! SideMenuListCell
            if indexPath.row == 0{
                cell.lblTitle.text = "Teachers"
                cell.lblCount.isHidden = true
            }else if indexPath.row == 1{
                cell.lblTitle.text = "Students"
                cell.lblCount.isHidden = true
                
                
            }else if indexPath.row == 2{
                cell.lblTitle.text = "Group"
                cell.lblCount.isHidden = true
                
            }else if indexPath.row == 3{
                cell.lblTitle.text = "Connection request"
                cell.lblCount.isHidden = false
                cell.lblCount.layer.cornerRadius = cell.lblCount.frame.size.height/2
                cell.lblCount.clipsToBounds = true
                
            }else {
                
            }
            cell.selectionStyle = .none
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuLogoutCell") as! SideMenuLogoutCell
            cell.selectionStyle = .none
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 80
            
        }
        else if indexPath.section == 1{
            return 50
        }else if indexPath.section == 2{
            return 120
        }else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            if indexPath.row == 3 {
                let vc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
                vc.isConnection = true
                vc.isChat = true
                self.navigationController?.pushViewController(vc, animated: true)
            }else{
                let vc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
                vc.isConnection = false
                vc.isChat = true
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
//        if indexPath.section == 2{
//            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
//
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
    }
    
}
