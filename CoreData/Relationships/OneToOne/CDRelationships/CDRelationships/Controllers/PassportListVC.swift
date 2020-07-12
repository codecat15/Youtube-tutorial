//
//  PassportListVC.swift
//  CDRelationships
//
//  Created by CodeCat15 on 7/8/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import UIKit

class PassportListVC: UIViewController {

    var passport : [Passport]?
    private let passportManager: PassportManager = PassportManager()

    @IBOutlet weak var tblPassportList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Passport List"
        // Do any additional setup after loading the view.
        viewWillSetUp()
    }

    func viewWillSetUp()
    {

        passport = passportManager.getAllPassports()
        if(passport != nil && passport?.count != 0)
        {
            self.tblPassportList.reloadData()
        }
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
