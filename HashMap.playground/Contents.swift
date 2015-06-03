// Hash map implementation with a fixed size table size (12 in this case) using
// chaining to resolve collisions

class LinkedHashEntry<E> {
    var value: E
    var key: Int
    var next: LinkedHashEntry<E>?
    
    init(key: Int, value: E) {
        self.key = key
        self.value = value
    }
}

class HashMap<E> {
    let TABLE_SIZE = 12
    var table: [LinkedHashEntry<E>?]
    init() {
        table = [LinkedHashEntry<E>?](count: TABLE_SIZE, repeatedValue: nil)
    }
    
    func get(key: Int) -> E? {
        let hash = (key % TABLE_SIZE)
        if table[hash] == nil {
            return nil
        }
        var entry = table[hash]
        while entry != nil && entry?.key != key {
            entry = entry?.next
        }
        return entry?.value
    }
    
    func put(key: Int, value: E) {
        let hash = (key % TABLE_SIZE)
        if table[hash] == nil {
            table[hash] = LinkedHashEntry<E>(key: key, value: value)
        } else {
            var entry = table[hash]
            while entry?.next != nil && entry?.key != key {
                entry = entry?.next
            }
            // this entry already exists
            if entry?.key == key {
                // update value
                entry?.value = value
            } else {
                entry?.next = LinkedHashEntry<E>(key: key, value: value)
            }
        }
    }
    
    func remove(key: Int) {
        let hash = (key % TABLE_SIZE)
        if table[hash] == nil {
            return
        }
        
        var prevEntry: LinkedHashEntry<E>?
        var entry = table[hash]
        while entry?.next != nil && entry?.key != key {
            prevEntry = entry
            entry = entry?.next
        }
        
        if entry?.key == key {
            if prevEntry == nil {
                table[hash] = entry?.next
            } else {
                prevEntry?.next = entry?.next
            }
        }
    }
}

var map = HashMap<Int>()
map.put(1, value: 200)
map.put(3, value: 100)
map.put(8, value: 500)

println(map.get(1))
println(map.get(4))

println(map.get(8))
map.put(8, value: 800)
println(map.get(8))
map.remove(8)
println(map.get(8))

// same hash: 37 % 12 = 1
map.put(37, value: 1370)
println(map.get(37))
// same hash: 49 % 12 = 1
map.put(49, value: 1380)
println(map.get(49))


// Space Complexity: O(n)
