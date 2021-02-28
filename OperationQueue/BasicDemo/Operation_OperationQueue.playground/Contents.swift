import UIKit

/*
 this was just a small demo of operation and operation queue in the coming days we will see few more examples with operation queue to explore them in details. If the video was helpful then please do like and share with your iOS group and please do support the channel by subscribing to it and sharing it with your iOS group

Thank you
~ CodeCat15

 */


struct Example
{
    func doWork() {

        let blockOperation = BlockOperation()

        blockOperation.addExecutionBlock {
            debugPrint("Hello")
        }

        blockOperation.addExecutionBlock {
            debugPrint("my name is")
        }

        blockOperation.addExecutionBlock {
            debugPrint("Ravi")
        }

//        blockOperation.start()

        let anotherBlockOperation = BlockOperation()
        anotherBlockOperation.addExecutionBlock {
            debugPrint("I am another block operation")
        }

        let operationQueue = OperationQueue()
        operationQueue.qualityOfService = .utility
        //operationQueue.addOperation(blockOperation)
       // operationQueue.addOperation(anotherBlockOperation)

        operationQueue.addOperations([blockOperation, anotherBlockOperation], waitUntilFinished: false)

    }
}

let obj = Example()
obj.doWork()
