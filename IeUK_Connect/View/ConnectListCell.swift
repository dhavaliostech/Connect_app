//
//  ConnectListCell.swift
//  IeUK_Connect
//
//  Created by PS on 16/10/18.
//  Copyright © 2018 PS. All rights reserved.
//

import UIKit

class ConnectListCell: UITableViewCell {

    @IBOutlet var backView: UIView!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var userName: UILabel!
    @IBOutlet var userImage: UIImageView!
    @IBOutlet var lblTIme: UILabel!
    @IBOutlet var lblCount: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
