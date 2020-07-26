//
//  LazyImageView.swift
//  lazyLoadingDemo
//
//  Created by CodeCat15 on 7/25/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation
import UIKit

/* Hey there I hope you enjoyed the session, as mentioned this code should only be used to understand the concept of lazy loading and to perform basic image caching you should not be using this in client projects

If the video was helpful then please feel free to share it with your iOS group and don't forget to like the video :)

 Feel free to ask questions on this topic I will be happy to answer them

 ~Codecat15

 */

class LazyImageView: UIImageView
{

    private let imageCache = NSCache<AnyObject, UIImage>()

    func loadImage(fromURL imageURL: URL, placeHolderImage: String)
    {
        self.image = UIImage(named: placeHolderImage)

        if let cachedImage = self.imageCache.object(forKey: imageURL as AnyObject)
        {
            debugPrint("image loaded from cache for =\(imageURL)")
            self.image = cachedImage
            return
        }

        DispatchQueue.global().async {
            [weak self] in

            if let imageData = try? Data(contentsOf: imageURL)
            {
                debugPrint("image downloaded from server...")
                if let image = UIImage(data: imageData)
                {
                    DispatchQueue.main.async {
                        self!.imageCache.setObject(image, forKey: imageURL as AnyObject)
                        self?.image = image
                    }
                }
            }
        }
    }
}
