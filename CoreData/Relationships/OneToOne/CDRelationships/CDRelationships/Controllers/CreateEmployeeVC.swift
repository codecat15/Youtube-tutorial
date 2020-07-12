//
//  CreateEmployeeVC.swift
//  CDRelationships
//
//  Created by CodeCat15 on 7/10/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import UIKit

class CreateEmployeeVC: UIViewController {

    @IBOutlet weak var txtEmployeeName: UITextField!
    @IBOutlet weak var imgEmployeePicture: UIImageView!
    @IBOutlet weak var txtPlaceOfIssue: UITextField!
    @IBOutlet weak var txtPassportNumber: UITextField!
    @IBOutlet weak var txtEmployeeEmail: UITextField!

    private var placeOfIssuePicker: UIPickerView!

    private let manager = EmployeeManager()
    let places = ["Bangalore", "Delhi","Indore", "Jaipur","Mumbai", "Pune"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewWillSetUp()
        let documentDirectoryPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        debugPrint(documentDirectoryPath[0])
    }

    func viewWillSetUp()
    {
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.black
        toolBar.sizeToFit()

        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.dismissPicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)

        toolBar.setItems([ spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true

        placeOfIssuePicker = UIPickerView()
        placeOfIssuePicker.dataSource = self
        placeOfIssuePicker.delegate = self
        
        self.txtPlaceOfIssue.inputView = placeOfIssuePicker
        self.txtPlaceOfIssue.inputAccessoryView = toolBar
    }

    @objc func dismissPicker() {
        self.view.endEditing(true)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {

        let passport = Passport(_id: UUID(), _passportId: self.txtPassportNumber.text, _placeOfIssue: self.txtPlaceOfIssue.text)

        let employee = Employee(_id: UUID(), _name: self.txtEmployeeName.text!, _email: self.txtEmployeeEmail.text!, _profilePicture: (self.imgEmployeePicture.image?.pngData())!, _passport: passport)

        manager.create(record: employee)
        displayAlert(alertMessage: "Record Saved")

    }

    @IBAction func clearAllButtonTapped(_ sender: Any) {
        self.txtEmployeeName.text = nil
        self.txtEmployeeEmail.text = nil
        self.txtPassportNumber.text = nil
        self.txtPlaceOfIssue.text = nil
    }

    @IBAction func selectImage(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .savedPhotosAlbum
        picker.delegate = self
        present(picker, animated: true)
    }

    private func displayAlert(alertMessage: String)
    {
        let alert = UIAlertController(title: "Alert", message: alertMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        self.present(alert, animated: true)
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
