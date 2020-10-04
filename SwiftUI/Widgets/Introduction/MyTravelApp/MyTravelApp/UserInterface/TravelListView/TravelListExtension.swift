//
//  TravelListExtension.swift
//  MyTravelApp
//
//  Created by CodeCat15 on 9/30/20.
//

import Foundation
import UIKit

extension TravelList : UITableViewDelegate, UITableViewDataSource{


    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        240
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.travelDetails.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "travellCell") as! TravelCell
        let data = self.travelDetails[indexPath.row]
        
        cell.destinationName.text = data.destination
        cell.travelType.text = data.travelby
        cell.travelDate.text = data.date
        if data.reservation == nil {
            cell.reservationView.backgroundColor = .red
        }

        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.travelDetails.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
