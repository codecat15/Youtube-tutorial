import UIKit

/**Hey there, I hope the video was useful and if it was then please do like the video and if you are new to the channel then please subscribe and share it with your iOS group. If you have any questions on the Equatable protocol then please feel free to reach out*/

struct Product : Equatable
{
    let name, brand, category: String

    static func == (lhs: Product, rhs: Product) -> Bool
    {
        debugPrint("Inside custom equality operator function")
        return lhs.category == rhs.category
    }
}

let product1 = Product(name: "MacBook Pro", brand: "Apple", category: "DSLR")

let product2 = Product(name: "MacBook Pro", brand: "Apple", category: "Laptop")

let product3 = Product(name: "Microsoft Surface", brand: "Microsoft", category: "Laptop")

let productArr = [product1, product2]

let result = productArr.contains(product3)

debugPrint(result)
