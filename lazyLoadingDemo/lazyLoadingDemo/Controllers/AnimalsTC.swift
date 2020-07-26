//
//  HerosTC.swift
//  lazyLoadingDemo
//
//  Created by CodeCat15 on 7/24/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import UIKit

class AnimalsTC: UITableViewCell {

    @IBOutlet weak var imgAnimal: LazyImageView!
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
