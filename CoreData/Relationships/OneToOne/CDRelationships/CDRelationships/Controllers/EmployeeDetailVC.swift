//
//  EmployeeDetailVC.swift
//  CDRelationships
//
//  Created by CodeCat15 on 7/10/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import UIKit

class EmployeeDetailVC: UIViewController {

    private let manager = EmployeeManager()
    var selectedEmployee: Employee? = nil

    @IBOutlet weak var txtPassportPlaceOfIssue: UITextField!
    @IBOutlet weak var txtPassportNumber: UITextField!
    @IBOutlet weak var txtEmployeeEmail: UITextField!
    @IBOutlet weak var txtEmployeeName: UITextField!
    @IBOutlet weak var imgEmployeeProfilePicture: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewWillSetUp()
    }

    func viewWillSetUp()
    {
        self.txtEmployeeName.text = selectedEmployee?.name
        self.txtEmployeeEmail.text = selectedEmployee?.email
        self.txtPassportNumber.text = selectedEmployee?.passport?.passportId
        self.txtPassportPlaceOfIssue.text = selectedEmployee?.passport?.placeOfIssue
        self.imgEmployeeProfilePicture.image = UIImage(data: (selectedEmployee?.profilePicture)!)
    }
    
    @IBAction func updateButtonTapped(_ sender: Any) {
    }

    @IBAction func deleteButtonTapped(_ sender: Any) {

        if(manager.deleteEmployee(byIdentifier: selectedEmployee!.id))
        {
            displayAlert(message: "Employee record deleted")
        }else
        {
            debugPrint("Delete failed")
        }
    }

    @IBAction func selectImage(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .savedPhotosAlbum
        picker.delegate = self
        present(picker, animated: true)
    }

    private func displayAlert(message: String)
    {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            self.navigationController?.popViewController(animated: true)
        }
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
