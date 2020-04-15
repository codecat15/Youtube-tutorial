//
//  ViewController.swift
//  UploadImageSample
//
//  Created by CodeCat15 on 4/9/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var imgView: UIImageView!

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    private var manager : ImageManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager = ImageManager()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapOnSelectImage(_ sender: Any) {

        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
        {
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self;
            myPickerController.sourceType = .photoLibrary
            self.present(myPickerController, animated: true, completion: nil)
        }
    }
    
    @IBAction func didTapOnUploadImage(_ sender: Any) {

        if(self.imgView.image != nil)
        {
            self.activityIndicator.isHidden = false
            manager?.uploadImage(data: (self.imgView.image?.pngData())!, completionHandler: { (response) in

                if(response.path.isEmpty == false)
                {
                    
                    DispatchQueue.main.async {
                        self.activityIndicator.isHidden = true
                        let alert = UIAlertController(title: "Image", message: "Image uploaded successfully", preferredStyle: .alert)
                        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                        alert.addAction(okAction)
                        self.present(alert, animated: true)
                    }
                }
            })
        }
    }


    // MARK: Image picker delegate method

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imgView.image = image
        }else{
            debugPrint("Something went wrong")
        }
        self.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

