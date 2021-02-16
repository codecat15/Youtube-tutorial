import Foundation

/**I hope the video was helpful, please feel free to ask questions and if you are new to the channel then please subscribe, like and share the video with your iOS group

 Regards,
 Ravi (CodeCat15)
 */

struct Example
{
    func work()
    {
        var arr: [String] = []
        let startTime = Date()

//        callApiA { (responseFromA) in
//            callApiB { (responseFromB) in
//                callApiC { (responseFromC) in
//                    arr.append(responseFromA)
//                    arr.append(responseFromB)
//                    arr.append(responseFromC)
//                    debugPrint(Date().timeIntervalSince(startTime))
//                }
//            }
//        }

        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        callApiA { (responseFromA) in
            arr.append(responseFromA)
            dispatchGroup.leave()
        }

        dispatchGroup.enter()
        callApiB { (responseFromB) in
            arr.append(responseFromB)
            dispatchGroup.leave()
        }

        dispatchGroup.enter()
        callApiC { (responseFromC) in
            arr.append(responseFromC)
            dispatchGroup.leave()
        }

        dispatchGroup.notify(queue: .main) {
            debugPrint(Date().timeIntervalSince(startTime))
        }
    }

    func callApiA(completion:@escaping(String)->Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(1), execute: {
            completion("data from service A")
        })
    }

    func callApiB(completion:@escaping(String)->Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(2), execute: {
            completion("data from service B")
        })
    }

    func callApiC(completion:@escaping(String)->Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(3), execute: {
            completion("data from service C")
        })
    }
}

let obj = Example()
obj.work()
