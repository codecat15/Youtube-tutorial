//
//  PlacesListVC.swift
//  MyPlacesApp
//
//  Created by CodeCat15 on 10/31/20.
//

import UIKit

class PlacesListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let places: [String] = ["Food", "Fitness", "Parks","Resturant"]

    @IBOutlet weak var tblPlaces: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        places.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        74
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "placesCell") as! PlacesCell
        cell.lblPlaceName.text = places[indexPath.row]
        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if(segue.identifier == SegueIdentifier.placesMapView)
        {
            let placesViewController = segue.destination as? PlacesVC
            guard placesViewController != nil else { return }
            placesViewController?.placeType = places[self.tblPlaces.indexPathForSelectedRow!.row]
        }
    }
}
