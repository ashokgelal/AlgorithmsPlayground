// ### INSERTION SORT ###

import Foundation

func sort(data: [Int]) -> [Int] {
    if data.count < 1 {
        return data
    }
    // create a copy to avoid changing original data
    var input = NSMutableArray(array: data) as NSArray as! [Int]
    
    for var i = 1; i < input.count; i++ {
        var extractedElem = input[i]
        var j : Int
        for j = i - 1; j >= 0 && extractedElem < input[j]; j-- {
            input[j + 1] = input[j]
        }
        input[j + 1] = extractedElem
    }
    
    return input
}

let data = [3, 44, 38, 5, 47, 15, 36, 26, 27, 2, 46, 4, 19, 50, 48]
let answer = [2, 3, 4, 5, 15, 19, 26, 27, 36, 38, 44, 46, 47, 48, 50]

let sorted = sort(data)
sequenceEquals(answer, sorted)


// O(1) extra space (ignoring input copy)
// O(n^2) comparisons and swaps
// ideal when data is nearly sorted or the problem size is small
