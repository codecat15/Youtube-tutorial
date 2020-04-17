import UIKit

// Hey there I hope you enjoyed the video, feel free to ask any questions you have on this topic, I will be happy to answer those. Do subscribe to the channel if you found the tutorial useful and share it with your iOS group.

protocol Product
{
    associatedtype Code
    var productCode: Code {get}
    func description() -> String
}

struct Laptop : Product
{
    typealias Code = String
    var productCode: String

    func description() -> String {
        "This is a Laptop"
    }
}

struct Keyboard : Product
{
    typealias Code = Int
    var productCode: Int

    func description() -> String {
        "This is a Keyboard"
    }
}

struct Factory
{
    func makeProducts() -> some Product
    {
        return Laptop(productCode: "test")
    }

    func makeProducts() -> Laptop
    {
        return Laptop(productCode: "test")
    }

    func makeProducts() -> Keyboard
    {
        return Keyboard(productCode: 1)
    }
}


func SquareArrayElements<T: Numeric>(array: Array<T>) -> some Sequence
{
    return array.lazy.map {$0 * $0}
}
