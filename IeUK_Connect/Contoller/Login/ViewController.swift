//
//  ViewController.swift
//  IeUK_Connect
//
//  Created by PS on 15/10/18.
//  Copyright © 2018 PS. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    
    // MARK:- IBOutlet
    
    @IBOutlet var mainBackView: UIView!
    
    @IBOutlet var height: NSLayoutConstraint!
    @IBOutlet var mainBackViewHeight: NSLayoutConstraint!
    @IBOutlet var topLogo: NSLayoutConstraint!
    @IBOutlet var logoTop: NSLayoutConstraint!
    @IBOutlet var btnForgetPassword: UIButton!
    @IBOutlet var btnLogin: UIButton!
    @IBOutlet var iconPassword: UIImageView!
    @IBOutlet var iconUserName: UIImageView!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var txtUserName: UITextField!
    @IBOutlet var loginBackView: UIView!
    @IBOutlet var passwordBackView: UIView!
    @IBOutlet var userNameBackView: UIView!
    @IBOutlet var iconLogo: UIImageView!
    // MARK:- View Events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let youtubeURL = "https://www.youtube.com/watch?v=uH8o-JTHJdM"
        let regex = try! NSRegularExpression(pattern: "\\?.*v=([^&]+)", options: .caseInsensitive)
        let match = regex.firstMatch(in: youtubeURL, options: [], range: NSRange(location: 0, length: youtubeURL.characters.count))
        if let videoIDRange = match?.range(at: 1) {
            let substringForFirstMatch = (youtubeURL as NSString).substring(with: videoIDRange)
            print(substringForFirstMatch)
        } else {
            //NO video URL
        }

        
        print(UIDevice.current.model)
       let center = self.view.frame.size.height/2
        let top = center - 100
        topLogo.constant = top
        if UIDeviceOrientationIsLandscape(UIDevice.current.orientation) {
            self.height.constant = self.view.frame.size.height
        }else {
            self.height.constant = self.view.frame.size.height-20
        }
        
        setCornerRadius(self.passwordBackView)
        setCornerRadius(self.btnLogin)
        self.view.setNeedsLayout()
        mainBackView.setNeedsLayout()
        
        passwordBackView.layer.shadowOpacity = 0.20
        passwordBackView.layer.shadowOffset = CGSize(width: 0, height: 4)
        passwordBackView.layer.shadowRadius = 2
        passwordBackView.layer.shadowColor = UIColor.black.cgColor
        passwordBackView.backgroundColor = UIColor.white
        passwordBackView.layer.masksToBounds = false
        passwordBackView.layer.cornerRadius = 10
        
        userNameBackView.layer.shadowOpacity = 0.20
        userNameBackView.layer.shadowOffset = CGSize(width: 0, height: 4)
        userNameBackView.layer.shadowRadius = 2
        userNameBackView.layer.shadowColor = UIColor.black.cgColor
        userNameBackView.backgroundColor = UIColor.white
        userNameBackView.layer.masksToBounds = false
        userNameBackView.layer.cornerRadius = 10
        // MARK: SetAnimation
        
        
        btnLogin.alpha = 0
        btnForgetPassword.alpha = 0
        txtPassword.alpha = 0
        txtUserName.alpha = 0
        loginBackView.alpha = 0
        passwordBackView.alpha = 0
        userNameBackView.alpha = 0
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    override func viewDidAppear(_ animated: Bool) {
        self.perform(#selector(self.startAnimation), with: nil, afterDelay: 1)
    }
    
    @objc func startAnimation () {
        
        setAnimation()
        self.fadeIn(withDuration: 3)
       
        
    }
    // MARK:- Animation For Login View
    func fadeIn(withDuration duration: TimeInterval = 1.0) {
        UIView.animate(withDuration: duration, animations: {
            self.btnLogin.alpha = 1
            self.btnForgetPassword.alpha = 1
            self.txtPassword.alpha = 1
            self.txtUserName.alpha = 1
            self.loginBackView.alpha = 1
            self.passwordBackView.alpha = 1
            self.userNameBackView.alpha = 1
        })
    }
    // MARK:- Animation Logo
    func setAnimation(){
        UIView.animate(withDuration:3, animations: {
          
            if UIDeviceOrientationIsLandscape(UIDevice.current.orientation) {
                
                if UIDevice().userInterfaceIdiom == .phone {
                    switch UIScreen.main.nativeBounds.height {
                    case 1136:
                        print("iPhone 5 or 5S or 5C")
                        
                        self.topLogo.constant = 10
                        self.iconLogo.frame = CGRect(x: 24, y: 10, width: self.view.frame.size.width-24-24, height: 70)
                    case 1334:
                        print("iPhone 6/6S/7/8")
                        self.topLogo.constant = 20
                        self.iconLogo.frame = CGRect(x: 24, y: 20, width: self.view.frame.size.width-24-24, height: 70)
                    case 1920, 2208:
                        print("iPhone 6+/6S+/7+/8+")
                        self.topLogo.constant = 20
                        self.iconLogo.frame = CGRect(x: 24, y: 20, width: self.view.frame.size.width-24-24, height: 70)
                    case 2436:
                        print("iPhone X")
                        self.topLogo.constant = 20
                        self.iconLogo.frame = CGRect(x: 24, y: 20, width: self.view.frame.size.width-24-24, height: 70)
                    default:
                        print("unknown")
                    }
                }
                
            }else {
                print("portrait")
                
                  self.topLogo.constant = 60
                self.iconLogo.frame = CGRect(x: 24, y: 60, width: self.view.frame.size.width-24-24, height: 70)
           }
        })
    }
    
    //MARK:- TextField Delegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == txtUserName {
            self.iconUserName.image = #imageLiteral(resourceName: "icnSelectUserName")
        }
        if textField == txtPassword{
            self.iconPassword.image = #imageLiteral(resourceName: "icnPasswordSelect")
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        if textField == txtUserName {
            self.iconUserName.image = #imageLiteral(resourceName: "icndUserName")
        }
        if textField == txtPassword{
            self.iconPassword.image = #imageLiteral(resourceName: "icnPassword")
        }
    }
    
    // MARK:- Button Event
    
    @IBAction func btnLoginaction(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        
        switch UIDevice.current.orientation{
        case .portrait:
            self.topLogo.constant = 60
            self.height.constant = self.view.frame.size.height-20
            
        case .portraitUpsideDown:
            self.topLogo.constant = 60
            self.height.constant = self.view.frame.size.height-20
        case .landscapeLeft:
           self.topLogo.constant = 10
            self.height.constant = self.view.frame.size.height
        case .landscapeRight:
            self.topLogo.constant = 10
            
            self.height.constant = self.view.frame.size.height
            
        default:
            print("Another")
        }
        
    }

    
    
}

