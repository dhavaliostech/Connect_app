//
//  ConnectionRequestCell.swift
//  IeUK_Connect
//
//  Created by PS on 17/10/18.
//  Copyright © 2018 PS. All rights reserved.
//

import UIKit

class ConnectionRequestCell: UITableViewCell {

    @IBOutlet var backView: UIView!
    @IBOutlet var btnAccept: UIButton!
    @IBOutlet var btnCancel: UIButton!
    @IBOutlet var lblConnection: UILabel!
    @IBOutlet var lblTime: UILabel!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblUserName: UILabel!
    @IBOutlet var userImages: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
