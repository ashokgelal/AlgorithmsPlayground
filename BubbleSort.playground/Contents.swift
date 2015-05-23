// ### BUBBLE SORT ###
import Foundation

func sort(data: [Int]) -> [Int]{
    // create a copy to avoid changing original data
    var input = NSMutableArray(array: data) as NSArray as! [Int]
    
    func swapAtIndex(indx: Int, withIndex: Int) {
        var temp = input[indx]
        input[indx] = input[withIndex]
        input[withIndex] = temp
    }
    
    var swapped = false
    do {
        swapped = false
        for var i = 0; i < input.count - 1; i++ {
            var leftElem = input[i]
            var rightElem = input[i + 1]
            if leftElem > rightElem {
                swapAtIndex(i, i + 1)
                swapped = true
            }
        }
    } while swapped
    return input
}

func sequenceEquals(arr1: [Int], arr2: [Int]) -> Bool {
    if arr1.count < arr2.count {
        return false
    }
    var match = true
    for (index, _) in enumerate(arr1) {
        if arr1[index] != arr2[index] {
            match = false
            break
        }
    }
    return match
}

let data = [3, 44, 38, 5, 47, 15, 36, 26, 27, 2, 46, 4, 19, 50, 48]
let answer = [2, 3, 4, 5, 15, 19, 26, 27, 36, 38, 44, 46, 47, 48, 50]

let sorted = sort(data)
sequenceEquals(answer, sorted)


// O(1) extra space (ignoring input copy)
// O(n^2) comparisons and swaps