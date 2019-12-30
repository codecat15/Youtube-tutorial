import UIKit

//Thank you so much for downloading the code, I hope this helps you in understanding computed properties. If you have any doubts feel free to drop a comment on youtube channel and please do subscribe to the channel if it has helped you and share it with your friends too. Happy iCoding and Have a nice day :) ~codecat15

struct LoanCalculator
{
    var loanAmount: Int
    var rateOfInterest: Int
    var year: Int
    var simpleInterest: Int
    {
        get
        {
            return (loanAmount * rateOfInterest * year) / 100
        }
    }
}

let loanCalculator = LoanCalculator(loanAmount: 500000, rateOfInterest: 10, year: 5)
debugPrint("Interest amount = \(loanCalculator.simpleInterest)")

struct Circle
{
    var radius: Double = 0
    var area: Double
    {
        get
        {
            return radius * radius * Double.pi
        }

        set(areaValue)
        {
            radius = sqrt(areaValue / Double.pi)
        }
    }
}

var circle = Circle()
circle.radius = 5
debugPrint("area = \(circle.area)")

circle.area = 40
debugPrint("radius = \(circle.radius)")

