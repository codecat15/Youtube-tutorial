//
//  EmployeeListCell.swift
//  CDcrudOperations
//
//  Created by CodeCat15 on 6/19/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import UIKit

class EmployeeListCell: UITableViewCell {

    @IBOutlet weak var imgProfilePicture: UIImageView!
    @IBOutlet weak var lblEmployeeName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
