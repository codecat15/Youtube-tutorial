//
//  HomeVC.swift
//  CoordinatorPatternDemo
//
//  Created by CodeCat15 on 1/11/22.
//

import UIKit

class HomeVC: UIViewController, CoordinatorBoard {

    @IBOutlet weak var userName: UILabel!
    var usrName: String = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
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
