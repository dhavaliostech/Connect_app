//
//  SearchListCell.swift
//  IeUK_Connect
//
//  Created by PS on 18/10/18.
//  Copyright © 2018 PS. All rights reserved.
//

import UIKit

class SearchListCell: UITableViewCell {

    @IBOutlet var userImages: UIImageView!
    @IBOutlet var btnAdd: UIButton!
    @IBOutlet var lblHeader: UILabel!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblUserName: UILabel!
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
