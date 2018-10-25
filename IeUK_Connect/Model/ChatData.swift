//
//  ChatData.swift
//  IeUK_Connect
//
//  Created by PS on 22/10/18.
//  Copyright © 2018 PS. All rights reserved.
//

import UIKit

class ChatData: NSObject {

    var strMessage:String!
    var isImage:Bool!
    var image:UIImage!
    var strTime:String!
    var isSeder:Bool!
    
    init(message:String,isImg:Bool,img:UIImage,time:String,issender:Bool) {
        strMessage = message
        isImage = isImg
        image = img
        strTime = time
        isSeder = issender
    }
}
