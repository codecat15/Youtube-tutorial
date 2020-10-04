//
//  TravelDetailsVC.swift
//  MyTravelApp
//
//  Created by CodeCat15 on 9/30/20.
//

import UIKit

class TravelDetailsVC: UIViewController {
    var travel: Travel? = nil

    @IBOutlet weak var destination : UITextField!
    @IBOutlet weak var reservation : UITextField!
    @IBOutlet weak var cost : UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        if(travel != nil)
        {
            destination.text = travel?.destination
            reservation.text = travel?.reservation?.hotelName
            cost.text = "\(travel?.reservation?.totalCost ?? 0)"
        }
        self.title = "Details"

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
