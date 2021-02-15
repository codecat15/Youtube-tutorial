//
//  EmployeeCell.swift
//  DGDemo
//
//  Created by CodeCat15 on 2/12/21.
//

import UIKit

class EmployeeCell: UITableViewCell {

    @IBOutlet weak var lblEmployeeEmail: UILabel!
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
