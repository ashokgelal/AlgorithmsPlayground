// ### SELECTION SORT ###

import Foundation

func sort(data: [Int]) -> [Int] {
    if data.count < 1 {
        return data
    }
    // create a copy to avoid changing original data
    var input = NSMutableArray(array: data) as NSArray as! [Int]
    
    func swapAtIndex(indx: Int, withIndex: Int) {
        if indx == withIndex {
            return
        }
        var temp = input[indx]
        input[indx] = input[withIndex]
        input[withIndex] = temp
    }
    
    for var i = 0; i < input.count; i++ {
        var minIndex = i
        for var j = i + 1; j < input.count; j++ {
            if input[j] < input[minIndex] {
                minIndex = j
            }
        }
        swapAtIndex(i, minIndex)
    }
    
    return input
}

let data = [3, 44, 38, 5, 47, 15, 36, 26, 27, 2, 46, 4, 19, 50, 48]
let answer = [2, 3, 4, 5, 15, 19, 26, 27, 36, 38, 44, 46, 47, 48, 50]

let sorted = sort(data)
sequenceEquals(answer, sorted)


// O(1) extra space (ignoring input copy)
// O(n^2) comparisons
// O(n) swaps
// ideal when the cost of swapping is high
