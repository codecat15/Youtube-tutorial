//
//  ShareSheet.swift
//  ImageShareDemo
//
//  Created by CodeCat15 on 1/23/21.
//

import Foundation
import SwiftUI

struct ShareSheet : UIViewControllerRepresentable  {

    var contents : [Any] = []

    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: contents, applicationActivities: nil)
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        
    }

    typealias UIViewControllerType = UIActivityViewController

}
