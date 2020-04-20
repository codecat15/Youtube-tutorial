import UIKit

// link to closure video part 1: https://youtu.be/a_7ZxRp1B2Q

// syntax revision of closures
// typealias with closure syntax
// function call sequence with closure
// autoclosure
// escaping and non-escapings

// Hey there, thanks for downloading the source code, do ask if you have any questions will be happy to answer them, if you like the video then please give a thumbs up and if you are new to the channel then please subscribe and share it with your iOS group ~ Ravi

func printGoodMorningMessage(isMorning: Bool, name:@autoclosure () -> String)
{
    debugPrint("printGoodMorningMessage")
    if(isMorning)
    {
        debugPrint("Good morning \(name())")
    }
}

func assignName(name: String) -> String
{
    debugPrint("assignName is called")
    return name
}

//printGoodMorningMessage(isMorning: false) { () -> String in
//    assignName(name: "Ravi")
//}

printGoodMorningMessage(isMorning: true, name: assignName(name: "Ravi"))

//printGoodMorningMessage(isMorning: true, name: assignName(name: "Ravi"))
//printGoodMorningMessage(isMorning: false, name: assignName(name: "Codecat15"))







//func addTwoNumbers(number1: Int, number2: Int) -> Int
//{
//    number1 + number2
//}
//
//let name : String = "value"
//
//typealias AddTwoNumberClosure = (_ number1: Int, _ number2: Int) -> Int
//
//let additionClosure : AddTwoNumberClosure =
//{
//    (_ number1: Int, _ number2: Int) -> Int in
//    return number1 + number2
//}
//
//debugPrint("additionResult = \(additionClosure(1,1))")

