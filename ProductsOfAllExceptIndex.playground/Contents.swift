// Example: input = [1, 7, 3, 4]; output = [84, 12, 28, 21]
func getProductsOfAllIntsExceptAtIndex(input: [Int]) -> [Int]{
    var output = [Int](count: input.count, repeatedValue: 1)
    
    var product = 1
    for (index, val) in enumerate(input) {
        output[index] = product
        product *= val
    }
    
    product = 1
    for var index = input.count - 1; index >= 0; index-- {
        output[index] *= product
        product *= input[index]
    }
    
    return output
}

var products = getProductsOfAllIntsExceptAtIndex([1, 7, 3, 4])
var answer = [84, 12, 28, 21]
sequenceEquals(answer, products)

// Time O(n) 
// Space O(n)
