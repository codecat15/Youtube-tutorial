//
//  TravelList.swift
//  MyTravelApp
//
//  Created by CodeCat15 on 9/30/20.
//

import UIKit

class TravelList: UIViewController {

    @IBOutlet weak var tblTravelList : UITableView!
    private var resource: TravelResourceProtocol = TravelResource()
    var travelDetails:[Travel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Travel list"
        resource.getTravelDetails { (response) in
            if(response != nil && response?.result != nil)
            {
                self.travelDetails = response?.result ?? []
                DispatchQueue.main.async {
                    self.tblTravelList.reloadData()
                }
            }
        }
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let destination = segue.destination as? TravelDetailsVC{
            destination.travel = self.travelDetails[self.tblTravelList.indexPathForSelectedRow!.row]
        }
    }


}
