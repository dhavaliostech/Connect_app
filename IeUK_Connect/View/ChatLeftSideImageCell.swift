//
//  ChatLeftSideImageCell.swift
//  IeUK_Connect
//
//  Created by PS on 23/10/18.
//  Copyright © 2018 PS. All rights reserved.
//

import UIKit

class ChatLeftSideImageCell: UITableViewCell {

    @IBOutlet var bavkView: UIView!
    @IBOutlet var lblTime: UILabel!
    @IBOutlet var photo: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
