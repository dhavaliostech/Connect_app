//
//  NotificationCell.swift
//  IeUK_Connect
//
//  Created by PS on 16/10/18.
//  Copyright © 2018 PS. All rights reserved.
//

import UIKit

class NotificationCell: UITableViewCell {

    
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var eventImages: UIImageView!
   
    @IBOutlet var backView: UIView!
    override func awakeFromNib() {
        
//        let path = UIBezierPath(roundedRect:eventImages.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 8, height: 8))
//        let maskLayer = CAShapeLayer()
//        maskLayer.frame = eventImages.bounds
//        maskLayer.path = path.cgPath
//        eventImages.layer.mask = maskLayer
//        self.eventImages.setNeedsLayout()
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
