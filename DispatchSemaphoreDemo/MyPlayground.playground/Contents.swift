import UIKit

/*

 Hey there, I hope the semaphore video was helpful and was able to clear all your doubts but if not then I am just an email (codecat15@gmail.com) away or you can reach out to me on social media my account name is @codecat15 and I will be happy to answer your question.

 If you are new to the channel then please do subscribe for new easy to understand swift programming content to boost your iOS career and do consider sharing this channel with your iOS group.

 Regards,
 Ravi (Codecat15)

 */

protocol Banking {
    func withDrawAmount(amount: Double) throws;
}

enum WithdrawalError : Error {
    case inSufficientAccountBalance
}

var accountBalance = 30000.00

struct Atm : Banking {

    func withDrawAmount(amount: Double) throws {
        debugPrint("inside atm")

        guard accountBalance > amount else { throw WithdrawalError.inSufficientAccountBalance }

        // Intentional pause : ATM doing some calculation before it can dispense money
        Thread.sleep(forTimeInterval: Double.random(in: 1...3))
        accountBalance -= amount
    }

    func printMessage() {
        debugPrint("ATM withdrawal successful, new account balance = \(accountBalance)")
    }
}

struct Bank : Banking {

    func withDrawAmount(amount: Double) throws {
        debugPrint("inside bank")

        guard accountBalance > amount else { throw WithdrawalError.inSufficientAccountBalance }

        // Intentional pause : Bank person counting the money before handing it over
        Thread.sleep(forTimeInterval: Double.random(in: 1...3))
        accountBalance -= amount
    }

    func printMessage() {
        debugPrint("Bank withdrawal successful, new account balance = \(accountBalance)")
    }
}

let queue = DispatchQueue(label: "semaphoreDemo", qos: .utility, attributes: .concurrent)

let semaphore = DispatchSemaphore(value: 1)

queue.async {
    // Money withdrawal from ATM
    do {
        semaphore.wait()
        let atm = Atm()
        try atm.withDrawAmount(amount: 10000) // withdraw 10K
        atm.printMessage()
        semaphore.signal()

    } catch WithdrawalError.inSufficientAccountBalance {
        semaphore.signal()
        debugPrint("ATM withdrawal failure: The account balance is less than the amount you want to withdraw, transaction cancelled")
    }
    catch {
        semaphore.signal()
        debugPrint("Error")
    }
}

queue.async {
    // Money withdrawal from Bank
    do {
        semaphore.wait()
        let bank = Bank()
        try bank.withDrawAmount(amount: 25000) // withdraw 25K
        bank.printMessage()
        semaphore.signal()

    } catch WithdrawalError.inSufficientAccountBalance  {
        semaphore.signal()
        debugPrint("Bank withdrawal failure: The account balance is less than the amount you want to withdraw, transaction cancelled")
    }
    catch{
        semaphore.signal()
        debugPrint("Error")
    }
}

