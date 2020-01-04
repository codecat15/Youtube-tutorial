import UIKit

/* Hello there, thanks for downloading the code. I hope the video helped you in understanding property observer. Please do support the channel by subscribing to the video and sharing it with your friends and social media or with anyone who wants to learn swift and clean coding in swift ~codecat15
 */

struct Bank
{
    var accountBalance: Double
    {
        didSet
        {
            sendMessageToUser()
        }
        willSet (newAccountBalance)
        {

        }
    }

    mutating func addMoney(amount: Double){
        accountBalance += amount
    }

    mutating func withDrawMoney(amount: Double){
        accountBalance -= amount
    }

    func sendMessageToUser()
    {
        debugPrint("Account balance updated new balance = \(accountBalance)")
    }
}

var bank = Bank(accountBalance: 10000)
bank.addMoney(amount: 5000)


/*class Bank
{
    var accountBalance: Double
    {
        didSet
        {
            sendMessageToUser()
        }
        willSet (newAccountBalance)
        {
            if(newAccountBalance >= 10000000)
            {
                sendMessageToAuditor()
            }
        }
    }

    init(_openingBalance: Double) {
        accountBalance = _openingBalance
    }

    func addMoney(amount: Double){
        accountBalance += amount
    }

    func withDrawMoney(amount: Double){
        accountBalance -= amount
    }

    func sendMessageToUser()
    {
        debugPrint("Account balance updated new balance = \(accountBalance)")
    }

    func sendMessageToAuditor()
    {
        debugPrint("Please check this account, and make sure the transaction is authentic")
    }
}

let bank = Bank(_openingBalance: 10000)
bank.addMoney(amount: 50000000)*/
