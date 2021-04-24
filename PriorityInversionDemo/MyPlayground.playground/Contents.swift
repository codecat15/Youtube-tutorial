import UIKit
import PlaygroundSupport

/*
Thank you for downloading the source code, I hope the video was helpful, if I have missed covering any point in the video or if you have questions then please do reach out via email or any of my social media handles I will be happy to answer your question.

 If you have not subscribed to the channel then please do subscribe and do share the channel with your iOS group. Support the channel so that I can continue to provide detailed and easy to understand videos on complex topics

 Thank you for your time
 Ravi (Codecat15) :)

 **/

PlaygroundPage.current.needsIndefiniteExecution = true

let highPriority = DispatchQueue.global(qos: .userInitiated)
let lowPriority = DispatchQueue.global(qos: .utility)
let defaultPriority = DispatchQueue.global(qos: .default)

let semaphore = DispatchSemaphore(value: 1)

func printEmoji(queue: DispatchQueue, emoji: String)
{
    queue.async {

        debugPrint("\(emoji) waiting")
        semaphore.wait()

        for i in 0...10 {
            debugPrint("\(emoji) \(i)")
        }

        debugPrint("\(emoji) signal")
        semaphore.signal()
    }
}

printEmoji(queue: highPriority, emoji: "🚑")
printEmoji(queue: lowPriority, emoji: "🚙")
printEmoji(queue: defaultPriority, emoji: "🏎")
