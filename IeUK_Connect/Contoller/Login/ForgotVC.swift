//
//  ForgotVC.swift
//  IeUK_Connect
//
//  Created by PS on 15/10/18.
//  Copyright © 2018 PS. All rights reserved.
//

import UIKit

class ForgotVC: UIViewController {

    @IBOutlet var lblEmailid: UILabel!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var btnLogin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setCornerRadius(self.btnLogin)
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
