//
//  LeftSideMessageCell.swift
//  IeUK_Connect
//
//  Created by PS on 18/10/18.
//  Copyright © 2018 PS. All rights reserved.
//

import UIKit

class LeftSideMessageCell: UITableViewCell {

    @IBOutlet var photoHeight: NSLayoutConstraint!
    @IBOutlet var lblMessage: UILabel!
    @IBOutlet var lblTime: UILabel!
    @IBOutlet var photo: UIImageView!
    @IBOutlet var backView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
