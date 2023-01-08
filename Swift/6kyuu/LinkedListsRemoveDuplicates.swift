class Node {
    var data: Int
    var next: Node?
    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

func removeDuplicates(head:Node?) -> Node? {
    if head == nil  {
        return nil
    }
    var cur = head
    var prev: Node? = nil
    var s = Set<Int>()
    while (cur != nil) {
        let val:Int = cur!.data
        if (s.contains(val)) {
            if cur?.next != nil {
                prev?.next = cur?.next!
            } else {
                prev?.next = nil
            }
        } else {
            s.insert(val)
            prev = cur
        }
        cur = cur?.next
    }
    return head!
}