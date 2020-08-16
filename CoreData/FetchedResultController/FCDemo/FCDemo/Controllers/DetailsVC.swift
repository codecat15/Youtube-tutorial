//
//  DetailsVC.swift
//  FCDemo
//
//  Created by CodeCat15 on 8/8/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    var selectedEmployee: Employee?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblName.text = selectedEmployee?.name
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
