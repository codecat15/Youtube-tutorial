import Foundation

/**

 I hope the video was helpful, please feel free to reach out for any issues or any if you have any machine round question then feel free to share it with me I'll try and add them to the series

 Based on the feedback of the video, I plan to continue this series, if you like to see such content in the future then please do like the video and add your comments in the video

 Regards,
 Ravi
 
 */


// Question # 1: remove duplicate from array
var arrayWithDuplicates : [Int] = [3,3,4,7,15,2,1,2,7,10,12,11,10,15,18,15,20,11]

var charArray : [Character] = ["a","a","c","b","b","d","e","e"]

extension Array where Element : Equatable {

    func removeDuplicate() -> [Element] {

        guard !self.isEmpty else {return []}

        var temp : [Element] = []

        self.forEach { item in
            if(!temp.contains(item)) {
                temp.append(item)
            }
        }

        return temp
    }
}

let result = arrayWithDuplicates.removeDuplicate()
print(result)


//let result = Set(arrayWithDuplicates)
//print(result)

//func removeDuplicate(arr: Array<Int>) -> Array<Int> {
//
//    guard !arr.isEmpty else {return []}
//
//
//    var temp : [Int] = []
//
//    arr.forEach { item in
//        if(!temp.contains(item)) {
//            temp.append(item)
//        }
//    }
//
//    return temp
//}


// Question # 2: create an array extension for only Int types

//extension Array where Element == Int {
//
//    func removeDuplicate() -> [Element] {
//
//        guard !self.isEmpty else {return []}
//
//        var temp : [Element] = []
//
//        self.forEach { item in
//            if(!temp.contains(item)) {
//                temp.append(item)
//            }
//        }
//
//        return temp
//    }
//}

// Question #3: Get all the capital characters from a string

var str = "Hello World"

func filterCapitalCharacters(fromString input: String) -> String? {

    guard input.isEmpty == false else { return nil}
    let result = input.filter({("A"..."Z").contains($0)})

    return result.isEmpty ? nil : result
}

print(filterCapitalCharacters(fromString: ""))

// Question #4: convert [Any] to [Int]

let input : [Any] = [true, 1, "ravi", 2, "codecat15", false, "test"]

func convertToIntArray(inputValue: [Any]) -> [Int] {

    guard inputValue.isEmpty == false else { return [] }

    let result = inputValue.compactMap { item in
        item as? Int
    }

    return result.isEmpty == false ? result : []
}

print(convertToIntArray(inputValue: input))
