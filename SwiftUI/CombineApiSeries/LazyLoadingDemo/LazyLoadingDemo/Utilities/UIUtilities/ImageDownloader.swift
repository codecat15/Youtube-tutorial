//
//  ImageDownloader.swift
//  LazyLoadingDemo
//
//  Created by CodeCat15 on 7/5/21.
//

import Foundation
import UIKit

/* I do hope the video was helpful, if you do have any questions then please do ask them as comments or you can reach out via other social platforms. Given are the link of the videos I mentioned in the lazy loading swiftui video. Do check them out and do share the channel with your iOS group if you think the contents of the channel can help them :)

 Lazy loading and image caching: https://youtu.be/Bytv3PJjNi4
 Listview and navigation: https://youtu.be/OLEijRSANpw
 API call with MVVM: https://youtu.be/ffglS7yAHxs

 Regards,
 Ravi (CodeCat15)
 */

extension UIImage {
    func resizeImage(with size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        draw(in: CGRect(origin: .zero, size: size))

        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage
    }
}

class ImageDownloader : ObservableObject {
    @Published var downloadedImage: UIImage?
    private let imagePath: URL

    init(imageUrl: String) {
        self.imagePath = URL(string: imageUrl)!
        getImage()
    }

    func getImage(){
        var urlRequest = URLRequest(url: self.imagePath)
        urlRequest.httpMethod = "get"
        URLSession.shared.dataTask(with: urlRequest) { [weak self] imageData, response, error in
            if(error == nil && imageData != nil){
                DispatchQueue.main.async {
                    let resizedImage = UIImage(data: imageData!)?.resizeImage(with: CGSize(width: 100, height: 100))
                    self?.downloadedImage = resizedImage
                }
            }
        }.resume()
    }
}
