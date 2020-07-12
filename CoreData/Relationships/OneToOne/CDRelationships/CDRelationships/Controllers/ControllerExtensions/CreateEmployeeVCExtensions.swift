//
//  CreateEmployeeVCExtensions.swift
//  CDRelationships
//
//  Created by CodeCat15 on 7/10/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation
import UIKit

extension CreateEmployeeVC : UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource
{
    // MARK: Picker view datasource and delegate methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.places.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return  self.places[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.txtPlaceOfIssue.text = self.places[row]
    }

    // MARK: Image picker delegate method
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let img = info[.originalImage] as? UIImage
        self.imgEmployeePicture.image = img
        dismiss(animated: true, completion: nil)
    }
}
