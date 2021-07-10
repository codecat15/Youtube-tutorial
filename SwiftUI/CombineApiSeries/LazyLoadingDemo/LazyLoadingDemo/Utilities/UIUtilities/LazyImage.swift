//
//  LazyImage.swift
//  LazyLoadingDemo
//
//  Created by CodeCat15 on 7/4/21.
//

import SwiftUI

struct LazyImage: View {
     static var defaultImage: UIImage = UIImage(named:"default")!
    @ObservedObject var imageDownloader: ImageDownloader

    init(imageUrl: String) {
        imageDownloader = ImageDownloader(imageUrl: imageUrl)
    }

    var body: some View {

        VStack{
            Image(uiImage: imageDownloader.downloadedImage ?? LazyImage.defaultImage)
                .resizable()
                .scaledToFit()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
        }
    }
}

struct LazyImage_Previews: PreviewProvider {
    static var previews: some View {
        LazyImage(imageUrl: "")
    }
}
