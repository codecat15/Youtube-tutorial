//
//  TravelCell.swift
//  MyTravelApp
//
//  Created by CodeCat15 on 9/30/20.
//

import UIKit

class TravelCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!{
        didSet{
            cardView.layer.cornerRadius = 5.0
            cardView.layer.shadowColor = UIColor.gray.cgColor
            cardView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
            cardView.layer.shadowRadius = 3.0
            cardView.layer.shadowOpacity = 0.7
        }
    }

    @IBOutlet weak var destinationName: UILabel!
    @IBOutlet weak var travelType: UILabel!
    @IBOutlet weak var travelDate: UILabel!

    @IBOutlet weak var reservationView: UIView!{
        didSet{
            reservationView.layer.cornerRadius = 5.0
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
