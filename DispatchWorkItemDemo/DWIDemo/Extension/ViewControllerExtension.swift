//
//  ViewControllerExtension.swift
//  DWIDemo
//
//  Created by CodeCat15 on 1/28/21.
//

import Foundation
import UIKit

/**

Thank you for download the code, I hope the video was helpful. If you have any questions please do feel free to reach out to via youtube comments or via email or social media, I will be happy to answer your questions. If you are new to the channel or have not subscribed yet please do support the channel by subscribing and sharing it with your iOS group

Regards,
Ravi (CodeCat15)

 */


extension ViewController : UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate
{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        workItemReference?.cancel()

        // make api call to fetch the data
        let animalSearchWorkItem = DispatchWorkItem
        {
            self.searchAnimalWithName(animalName: searchText)
        }

        workItemReference = animalSearchWorkItem

        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: animalSearchWorkItem)

    }

    private func searchAnimalWithName(animalName: String)
    {
        resource.searchAnimal(name: animalName, completion: { (response) in
                                self.searchedAnimal.removeAll()
                                if(response != nil && response!.count > 0) {

                                    self.searchedAnimal.append(contentsOf: response!.map{$0.name})
                                    self.searching = true

                                    DispatchQueue.main.async {
                                        self.tblAnimal.reloadData()
                                    }
                                }})
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = String()
        tblAnimal.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searching){
            return searchedAnimal.count
        }else{
            return animals.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell") as! AnimalCell
        if(searching){
            cell.lblAnimal.text = searchedAnimal[indexPath.row]
        }else{
            cell.lblAnimal.text = animals[indexPath.row]
        }
        return cell
    }
}
