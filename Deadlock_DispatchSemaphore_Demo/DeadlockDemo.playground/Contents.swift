import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

/*
 Thank you for watching the video, I hope it was helpful. If you have doubts then please feel free to reach out via comments or social media I will be happy to answer your question.

 If you have not subscribed to the channel then please do subscribe and don't forget to turn on the bell notification, and do share the channel with your friends.

 Regards,
 Ravi (CodeCat15)

 */


let highPriorityQueue = DispatchQueue.global(qos: .userInitiated)
let lowPriorityQueue = DispatchQueue.global(qos: .utility)

let codecat15Semaphore = DispatchSemaphore(value: 1)
let codecat15BrotherSemaphore = DispatchSemaphore(value: 1)


func requestForResource(resource: String, prioritySymbol: String, semaphore: DispatchSemaphore)
{
    debugPrint("\(prioritySymbol) is waiting for resource = \(resource)")
    semaphore.wait(timeout: DispatchTime.now() + 5)
}

func prepareBreakfast(queue: DispatchQueue, prioritySymbol: String, firstResource: String, firstSemaphore: DispatchSemaphore, secondResource: String, secondSemaphore: DispatchSemaphore)
{
    queue.async {

        requestForResource(resource: firstResource, prioritySymbol: prioritySymbol, semaphore: firstSemaphore)

        for i in 0...10 {
            if(i == 4)
            {
                requestForResource(resource: secondResource, prioritySymbol: prioritySymbol, semaphore: secondSemaphore)
            }
            debugPrint("\(prioritySymbol) \(i)")
        }

        debugPrint("signal called")
        firstSemaphore.signal()
        secondSemaphore.signal()
    }
}

prepareBreakfast(queue: highPriorityQueue, prioritySymbol: "🐈", firstResource: "Pan", firstSemaphore: codecat15Semaphore, secondResource: "Oil", secondSemaphore: codecat15BrotherSemaphore)

prepareBreakfast(queue: lowPriorityQueue, prioritySymbol: "🦖", firstResource: "Oil", firstSemaphore: codecat15BrotherSemaphore, secondResource: "Pan", secondSemaphore: codecat15Semaphore)

