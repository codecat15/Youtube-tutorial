//
//  ContentView.swift
//  ImageShareDemo
//
//  Created by CodeCat15 on 1/23/21.
//

/**

 I hope the video was helpful. If you have any questions then please feel free to ask them I will be happy to answer them. Please do support the channel by subscribing and sharing it with your iOS group on social media platform.

 Regards,
 Ravi (Codecat15)

 */

import SwiftUI

struct ContentView: View {

    @State private var currentImage : UIImage = UIImage(named: "placeholder") ?? UIImage()
    @State private var showPhotoLibrary : Bool = false
    @State private var showShareSheet : Bool = false
    
    var body: some View {
        
        VStack {
            
            Image(uiImage: currentImage).resizable()
                .scaledToFit()
            
            HStack {
                Button("Select Image") {
                    // show photo gallery
                    showPhotoLibrary.toggle()
                }
                .sheet(isPresented: $showPhotoLibrary, content: {
                    ImagePicker(sourceType: .photoLibrary, selectedImage: $currentImage)
                })

                Spacer()

                Button("Share") {
                    // show the share options
                    showShareSheet.toggle()
                }

                .sheet(isPresented: $showShareSheet, content: {
                    ShareSheet(contents: [currentImage])
                })
            }.padding(10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
