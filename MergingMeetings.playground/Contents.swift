func mergeRanges(ranges: [(start: Int, end: Int)]) -> [(start: Int, end: Int)]{
    var sorted = ranges.sorted { $0.start < $1.start }
    var mergedMeetings : [(start: Int, end: Int)] = []
    var (prevMeetingStart, prevMeetingEnd) = sorted[0]
    
    for (currMeetingStart, currMeetingEnd) in sorted[1..<sorted.count] {
        if currMeetingStart <= prevMeetingEnd {
            prevMeetingEnd = max(currMeetingEnd, prevMeetingEnd)
        } else {
            mergedMeetings.append(start: prevMeetingStart as Int, end: prevMeetingEnd as Int)
            prevMeetingStart = currMeetingStart
            prevMeetingEnd = currMeetingEnd
        }
    }
    mergedMeetings.append(start: prevMeetingStart as Int, end: prevMeetingEnd as Int)
    return mergedMeetings
}

mergeRanges([(0, 1), (3, 5), (4, 8), (9, 10), (10, 12)])

// Time O(nlogn)
// Space O(n)
