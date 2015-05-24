//
// This file (and all other Swift source files in the Sources directory of this playground) will be precompiled into a framework which is automatically made available to Sorting.playground.
//
public func sequenceEquals(arr1: [Int], arr2: [Int]) -> Bool {
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