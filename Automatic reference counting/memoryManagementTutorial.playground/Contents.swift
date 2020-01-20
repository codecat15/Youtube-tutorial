import UIKit

/*
 Thank you for downloading the code, I hope you enjoyed the video tutorial. Please feel free to ask me questions on this topic if I have missed anything in the video OR any memory management related issue you are facing.

 Please do subscribe to the channel and share it with your friends or iOS group and request them to subscribe as well :)

 Happy iCoding ~Codecat15

 */

class Person
{
    var name: String
    weak var job: Job?

    init(_name: String) {
        debugPrint("init method of Person called")
        name = _name
    }

    func printName() {
        debugPrint("name is \(name)")
    }

    deinit {
        debugPrint("deinit called for person class")
    }
}

//var objPerson1: Person?
//var objPerson2: Person?
//
//if (1 == 1)
//{
//    let objPerson = Person(_name: "codect15")
//    objPerson1 = objPerson
//    objPerson2 = objPerson
//    objPerson.printName()
//}

class Job
{
    var jobDescription: String
    weak var person: Person?

    init(_jobDescription: String) {
        debugPrint("init method of Job called")
        jobDescription = _jobDescription
    }

    deinit {
        debugPrint("deinit called for job class")
    }
}

if (1 == 1)
{
    let objPerson = Person(_name: "codect15")
    let objJob = Job(_jobDescription: "swift programmer")
    objPerson.job = objJob
    objJob.person = objPerson
}


