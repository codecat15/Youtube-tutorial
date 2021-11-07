//
//  BalanceActor.swift
//  ActorDemo
//
//  Created by CodeCat15 on 10/25/21.
//

import Foundation

/*
hey there, I hope the video was helpful in explaining actor keyword. If you have any questions then please feel free to ask them via comments or you can reach out to me on social platforms.

 If you think the video is helpful then please do share the same with your iOS group on whatsapp, facebook and linkedin.

 And if you are new to the channel then please do support the channel by subscribing to it. This is a way which motivates me to make more of such detailed videos would appreciate the gratitude.

 Regards,
 Ravi (CodeCat15)

 */


actor PhoneStocks {

    var stocks : Array<String> = ["iPhone 13", "Samsung S 21", "Pixel 4" ]
//    let barrier = DispatchQueue(label: "barrierQueue")

    func getAvailablePhones() {
       // barrier.sync {
            print("available phones for purchase are = \(stocks)")
        //}
    }

    func purchase(phone: String) {

        //barrier.async(flags:.barrier) {
            guard let index = self.stocks.firstIndex(of: phone) else {
                print("no such phone in stock")
                return
            }
            self.stocks.remove(at: index)
            print(" 🎉 Congratulations on purchase of a new \(phone) 🎉 ")
        //}
    }
}
