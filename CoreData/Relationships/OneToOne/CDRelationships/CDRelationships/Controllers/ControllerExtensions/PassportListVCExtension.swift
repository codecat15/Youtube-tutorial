//
//  PassportListVCExtension.swift
//  CDRelationships
//
//  Created by CodeCat15 on 7/8/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation
import UIKit

extension PassportListVC: UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.passport?.count ?? 0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "passportListTC") as! PassportListTC
        let passport = self.passport![indexPath.row]

        cell.lblEmployeeName.text = passport.name
        cell.lblPassportId.text = passport.passportId

        return cell
    }
}

