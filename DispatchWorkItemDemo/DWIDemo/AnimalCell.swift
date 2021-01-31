//
//  AnimalCell.swift
//  DWIDemo
//
//  Created by CodeCat15 on 1/27/21.
//

import UIKit

class AnimalCell: UITableViewCell {

    @IBOutlet weak var lblAnimal: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
