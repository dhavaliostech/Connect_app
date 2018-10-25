//
//  Utility.swift
//  IeUK_Connect
//
//  Created by PS on 15/10/18.
//  Copyright © 2018 PS. All rights reserved.
//

import Foundation
import UIKit

func setShadow(_ UIview:UIView){
    UIview.layer.shadowOpacity = 0.18
    UIview.layer.shadowOffset = CGSize(width: 0, height: 2)
    UIview.layer.shadowRadius = 2
    UIview.layer.shadowColor = UIColor.init(red: 189.0/255, green: 193.0/255, blue: 194/255, alpha: 0.25).cgColor
    UIview.layer.masksToBounds = false
}
func setCornerRadius(_ UIView:UIView)
{
    UIView.layer.cornerRadius = 8
    UIView.clipsToBounds = true
}

extension UIApplication {
    var statusBarView: UIView? {
        if responds(to: Selector("statusBar")) {
            return value(forKey: "statusBar") as? UIView
        }
        return nil
    }
}

