import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

//Thank you for downloading the code I hope this helps you in learning and implementing clean code in your project. Feel free to ask me any questions and do subscribe to the channel :) ~ CodeCat15

protocol AdditionResultDelegate : class
{
    func didFinishAddingTwoNumbers(result: Int)
}

class Developer
{
    weak var managerReference: AdditionResultDelegate?

    func developerWillAddTwoNumber(a: Int, b: Int)
    {
        let result = a + b
        managerReference?.didFinishAddingTwoNumbers(result: result)
    }
}

class Manager : AdditionResultDelegate
{
    var developer: Developer?

    init(_developer: Developer) {
        developer = _developer
        developer?.managerReference = self
    }

    func didFinishAddingTwoNumbers(result: Int)
    {
        debugPrint("result of addition = \(result)")
    }

    func addTwoNumber(x: Int, y: Int)
    {
        developer?.developerWillAddTwoNumber(a: x, b: y)
    }
}

let objManager = Manager(_developer: Developer())
objManager.addTwoNumber(x: 10, y: 10)




struct Image
{
    static let imageUrl = "https://www.syanart.com/wp-content/uploads/bfi_thumb/Dragon-Ball-Super-Goku-Ultra-Instinct-White-4K-1024x576-3700nnnlymflyci783q8e8.jpg"
}


protocol ImageDownloadDelegate : class
{
    func didFinishDownloadingImage(imageData: Data?)
}

class ImageDownloader //Just like the developer class
{
    weak var delegate: ImageDownloadDelegate?

    func downloadImageFromServer(url: URL)
    {
        URLSession.shared.dataTask(with:url) { (imageData, response, error) in
            //return the result to the calling class
            self.delegate?.didFinishDownloadingImage(imageData: imageData)
        }.resume()
    }
}

class ProfileImageViewer : ImageDownloadDelegate //Just like the manager class
{
    var imageDownloader: ImageDownloader?

    init(_imageDownloader: ImageDownloader) {
        imageDownloader = _imageDownloader
        imageDownloader?.delegate = self
        imageDownloader?.downloadImageFromServer(url: URL(string: Image.imageUrl)!)
    }

    func didFinishDownloadingImage(imageData: Data?)
    {
        let image = UIImage(data: imageData!)
    }
}

let objProfileImageViewer = ProfileImageViewer(_imageDownloader: ImageDownloader())

