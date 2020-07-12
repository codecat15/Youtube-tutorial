//
//  EmployeeDetailExtensions.swift
//  CDRelationships
//
//  Created by CodeCat15 on 7/10/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation
import UIKit

extension EmployeeDetailVC : UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    // MARK: Image picker delegate method
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let img = info[.originalImage] as? UIImage
        self.imgEmployeeProfilePicture.image = img
        dismiss(animated: true, completion: nil)
    }
}
