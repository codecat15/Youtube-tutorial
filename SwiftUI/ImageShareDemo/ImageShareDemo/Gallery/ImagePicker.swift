//
//  ImageGallery.swift
//  ImageShareDemo
//
//  Created by CodeCat15 on 1/23/21.
//

import Foundation
import SwiftUI

struct ImagePicker : UIViewControllerRepresentable {

    var sourceType : UIImagePickerController.SourceType = .photoLibrary
    @Binding var selectedImage : UIImage
    @Environment(\.presentationMode) private var presentationMode

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {

    }

    class Coordinator : NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

        let parent: ImagePicker
        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

            if let userSelectedImage = info[.originalImage] as? UIImage {
                parent.selectedImage = userSelectedImage
            }

            parent.presentationMode.wrappedValue.dismiss()
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    typealias UIViewControllerType = UIImagePickerController

    
}
