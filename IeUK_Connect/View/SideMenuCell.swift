//
//  SideMenuCell.swift
//  IeUK_Connect
//
//  Created by PS on 17/10/18.
//  Copyright © 2018 PS. All rights reserved.
//

import UIKit

class SideMenuCell: UITableViewCell {

    @IBOutlet var backView: UIView!
    @IBOutlet var userProfile: UIImageView!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
