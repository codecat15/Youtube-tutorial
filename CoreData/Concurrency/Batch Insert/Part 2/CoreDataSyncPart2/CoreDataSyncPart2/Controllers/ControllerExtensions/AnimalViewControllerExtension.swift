//
//  AnimalViewControllerExtension.swift
//  CoreDataSyncPart1
//
//  Created by CodeCat15 on 8/14/21.
//

import Foundation
import UIKit

extension AnimalsViewController : UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        animals?.count ?? 0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        85
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "animalViewCell") as! AnimalViewCell

        let animal = self.animals![indexPath.row]
        cell.lblAnimalName.text = animal.name

        return cell
    }
}
