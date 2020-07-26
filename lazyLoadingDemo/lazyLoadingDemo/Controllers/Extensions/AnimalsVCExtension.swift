//
//  HeroVCExtension.swift
//  lazyLoadingDemo
//
//  Created by CodeCat15 on 7/24/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation
import UIKit

extension AnimalsVC : UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.animal?.count ?? 0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        140
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "animalsCell") as! AnimalsTC

        let animal = self.animal?[indexPath.row]
        cell.lblName.text = animal?.name

        let animalImageUrl = URL(string: (animal?.image)!)!
        cell.imgAnimal.loadImage(fromURL: animalImageUrl, placeHolderImage: "LaunchImage")
        
        return cell
    }
}
