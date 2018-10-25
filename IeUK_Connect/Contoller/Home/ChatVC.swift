//
//  ChatVC.swift
//  IeUK_Connect
//
//  Created by PS on 18/10/18.
//  Copyright © 2018 PS. All rights reserved.
//

import UIKit
import SideMenu
class ChatVC: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet var backView: UIView!
    @IBOutlet var txtMessage: UITextView!
    @IBOutlet var tblChat: UITableView!
    //var arrChat:[ChatData] = []
    var arrChat:[ChatData] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        var obj = ChatData(message: "Hiii", isImg: false, img: #imageLiteral(resourceName: "icnEmail"), time: "10:00 PM", issender: false)
        var obj1 = ChatData(message: "", isImg: true, img: #imageLiteral(resourceName: "icnEmail"), time: "10:00 PM", issender: false)
        var obj2 = ChatData(message: "hii", isImg: false, img: #imageLiteral(resourceName: "icnEmail"), time: "10:00 PM", issender: true)
        var obj3 = ChatData(message: "fine", isImg: false, img: #imageLiteral(resourceName: "icnEmail"), time: "10:00 PM", issender: true)
        
        arrChat.append(obj)
        arrChat.append(obj1)
        arrChat.append(obj2)
        arrChat.append(obj3)
        self.txtMessage.text = ""
        
        backView.layer.shadowOpacity = 0.20
        backView.layer.shadowOffset = CGSize(width: 0, height: 4)
        backView.layer.shadowRadius = 2
        backView.layer.shadowColor = UIColor.black.cgColor
        backView.layer.masksToBounds = false
        backView.layer.cornerRadius = 10
        
        SideMenuManager.default.menuWidth =  300
        SideMenuManager.default.menuPresentMode = .menuSlideIn
        
        //SideMenuManager.default.menuRightSwipeToDismissGesture?.accessibilityViewIsModal = false
        //SideMenuManager.default.menuDismissOnPush = false
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tblChat.setNeedsLayout()
        self.tblChat.cellLayoutMarginsFollowReadableWidth = true
    }
    override func viewDidAppear(_ animated: Bool) {
        
        
    }
    
    @IBAction func btnSendaction(_ sender: UIButton) {
        if txtMessage.text.isEmpty == true{
            
        }else if txtMessage.text == " "{
            
        }else {
            let obj = ChatData(message: txtMessage.text, isImg: false, img: #imageLiteral(resourceName: "icnSend"), time: "10:00 PM", issender: true)
            self.arrChat.append(obj)
            self.tblChat.reloadData()
           
            let indexpath = IndexPath(item: arrChat.count-1, section: 0)
            self.tblChat.scrollToRow(at: indexpath as IndexPath, at: .bottom, animated: true)
            
            self.txtMessage.text = ""
        }
    }
    
    @IBAction func btnBackaction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnSelectMediaaction(_ sender: UIButton) {
        
        takePhoto()
    }
    func takePhoto(){
        let actionSheet = UIAlertController(title: "Choose Image option", message: nil, preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { (action) in
            
            if(UIImagePickerController.isSourceTypeAvailable(.camera)){
                let imagePicker = UIImagePickerController()
                imagePicker.sourceType = .camera
                imagePicker.allowsEditing = true
                imagePicker.delegate = self
                
                self.present(imagePicker, animated: true, completion: nil)
                
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
                let imagePicker = UIImagePickerController()
                imagePicker.sourceType = .photoLibrary
                imagePicker.allowsEditing = true
                imagePicker.delegate = self
                
                self.present(imagePicker, animated: true, completion: nil)
                
            }
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (action) in
            self.dismiss(animated: true, completion: nil)
            
        }))
        
        self.present(actionSheet, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            let obj = ChatData(message: "", isImg: true, img: pickedImage, time: "10:00 PM", issender: true)
            self.arrChat.append(obj)
            self.tblChat.reloadData()
            
            let indexpath = IndexPath(item: arrChat.count-1, section: 0)
            self.tblChat.scrollToRow(at: indexpath as IndexPath, at: .bottom, animated: true)
            //let cell = tblList.cellForRow(at: IndexPath(item:0 , section: 0)) as! SideMenuCell
            //cell.userProfile.image = pickedImage
             picker.dismiss(animated: true, completion: nil)
            
        }else{
            picker.dismiss(animated: true, completion: nil)
        }
       
        
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
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
extension ChatVC:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrChat.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let obj = arrChat[indexPath.row]
        if obj.isSeder == false {
            if obj.isImage == false{
                let leftcell = tableView.dequeueReusableCell(withIdentifier: "LeftSideMessageCell") as! LeftSideMessageCell
                leftcell.selectionStyle = .none
                
                leftcell.backView.layer.shadowOpacity = 0.20
                leftcell.backView.layer.shadowOffset = CGSize(width: 0, height: 4)
                leftcell.backView.layer.shadowRadius = 2
                leftcell.backView.layer.shadowColor = UIColor.black.cgColor//UIColor.init(red: 189.0/255, green: 193.0/255, blue: 194/255, alpha: 0.25).cgColor
                leftcell.backView.backgroundColor = UIColor.white
                leftcell.backView.layer.masksToBounds = false
                leftcell.backView.layer.cornerRadius = 10
                
             
                    leftcell.isHidden = false
                    leftcell.lblMessage.text = obj.strMessage
               
                leftcell.lblTime.text = obj.strTime
                
                return leftcell
            }else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ChatLeftSideImageCell") as! ChatLeftSideImageCell
                cell.selectionStyle = .none
                
                cell.bavkView.layer.shadowOpacity = 0.20
                cell.bavkView.layer.shadowOffset = CGSize(width: 0, height: 4)
                cell.bavkView.layer.shadowRadius = 2
                cell.bavkView.layer.shadowColor = UIColor.black.cgColor//UIColor.init(red: 189.0/255, green: 193.0/255, blue: 194/255, alpha: 0.25).cgColor
                cell.bavkView.backgroundColor = UIColor.white
                cell.bavkView.layer.masksToBounds = false
                cell.bavkView.layer.cornerRadius = 10
                cell.photo.layer.cornerRadius = 8
                cell.photo.clipsToBounds = true
                cell.photo.image = obj.image
                cell.lblTime.text = obj.strTime
                return cell
            }
        }else{
            if obj.isImage == false {
                let cell  = tableView.dequeueReusableCell(withIdentifier: "RightSideMessageCell") as! RightSideMessageCell
                cell.selectionStyle = .none
                cell.backView.layer.shadowOpacity = 0.20
                cell.backView.layer.shadowOffset = CGSize(width: 0, height: 4)
                cell.backView.layer.shadowRadius = 2
                cell.backView.layer.shadowColor = UIColor.black.cgColor//UIColor.init(red: 189.0/255, green: 193.0/255, blue: 194/255, alpha: 0.25).cgColor
                cell.backView.backgroundColor = UIColor.white
                cell.backView.layer.masksToBounds = false
                cell.backView.layer.cornerRadius = 10
                
                
                
                    cell.lblMessages.isHidden = false
                
                    cell.lblMessages.text = obj.strMessage
                
                cell.lblTime.text = obj.strTime
                return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChatRightSideImageCell") as! ChatRightSideImageCell
                cell.selectionStyle = .none
                cell.backView.layer.shadowOpacity = 0.20
                cell.backView.layer.shadowOffset = CGSize(width: 0, height: 4)
                cell.backView.layer.shadowRadius = 2
                cell.backView.layer.shadowColor = UIColor.black.cgColor//UIColor.init(red: 189.0/255, green: 193.0/255, blue: 194/255, alpha: 0.25).cgColor
                cell.backView.backgroundColor = UIColor.white
                cell.backView.layer.masksToBounds = false
                cell.backView.layer.cornerRadius = 10
                cell.photo.layer.cornerRadius = 8
                cell.photo.clipsToBounds = true
                cell.photo.image = obj.image
                cell.lblTime.text = obj.strTime
            return cell
            
            
        }
        }
    }
}
