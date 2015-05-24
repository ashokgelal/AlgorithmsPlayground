func highestProductOf3(input: [Int]) -> Int{
    if input.count < 3 {
        return 0
    }
    var highest = max(input[0], input[1])
    var lowest = min(input[0], input[1])
    var highestProductOf2 = input[0...1].reduce(1, combine: *)
    var lowestProductOf2 = input[0...1].reduce(1, combine: *)
    var highestProductOf3 = input[0...2].reduce(1, combine: *)
    
    for curr in input[2..<input.count] {
        highestProductOf3 = max(highestProductOf3, curr * highestProductOf2, curr * lowestProductOf2)
        highestProductOf2 = max(highestProductOf2, curr * highest, curr * lowest)
        lowestProductOf2 = min(lowestProductOf2, curr * highest, curr * highest)
        highest = max(highest, curr)
        lowest = min(lowest, curr)
    }
    return highestProductOf3
}

var data1 = [3, 6, 2, 5, 4]
var output1 = highestProductOf3(data1)
var answer1 = 6 * 5 * 4
answer1 == output1

var data2 = [1, 10, -5, 1, -100]
var output2 = highestProductOf3(data2)
var answer2 = -5 * 10 * -100
answer2 == output2

// Time O(n)
// Space O(1)