func getMaxProfit(stockPrices: [Int]) -> Int? {
    if stockPrices.count < 2 {
        return nil
    }
    
    var minPrice = stockPrices[0]
    var maxProfit = stockPrices[1] - minPrice
    
    for (index, currentPrice) in enumerate(stockPrices) {
        if index == 0 {
            continue
        }
        
        var potentialProfit = currentPrice - minPrice
        maxProfit = max(maxProfit, potentialProfit)
        minPrice = min(minPrice, currentPrice)
    }
    
    return maxProfit
}

var profit = getMaxProfit([502, 521, 511, 510, 520, 515, 545, 530, 450, 530, 563, 343])

// Answer
profit == 113

// Time O(n) 
// Space O(1)
