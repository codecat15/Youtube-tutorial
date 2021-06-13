import Combine

/* I hope the video was helpful, please feel free to ask questions and if you are new to the channel then please do subscribe and support the channel by sharing it with your iOS group.
 Regards,
 Ravi (CodeCat15)
 */

func addTwoNumbers(a: Int, b: Int) -> Int {
    a + b
}

let justPublisher = Just(addTwoNumbers(a: 1, b: 2))

let justSubscriber = Subscribers.Sink<Int, Never> { completion in
    print(completion)
} receiveValue: { valueFromPublisher in
    print("value = \(valueFromPublisher)")
}

//let justSubscriber1 = Subscribers.Sink<Int, Never> { completion in
//    print("justSubscriber1 = \(completion)")
//} receiveValue: { valueFromPublisher in
//    print("justSubscriber1 = \(valueFromPublisher)")
//}


justPublisher.subscribe(justSubscriber)
//justPublisher.subscribe(justSubscriber1)
