func getCard() -> [String] {
  let r1:[Int] = createRandomUniqueArray(1, 15, 5)
  let c1:[String] = r1.map{"B" + String($0)}
  let r2:[Int] = createRandomUniqueArray(16, 31, 5)
  let c2:[String] = r2.map{"I" + String($0)}
  let r3:[Int] = createRandomUniqueArray(31, 46, 4)
  let c3:[String] = r3.map{"N" + String($0)}
  let r4:[Int] = createRandomUniqueArray(46, 61, 5)
  let c4:[String] = r4.map{"G" + String($0)}
  let r5:[Int] = createRandomUniqueArray(61, 75, 5)
  let c5:[String] = r5.map{"O" + String($0)}
  let answer = (c1 + c2 + c3 + c4 + c5)
  return answer
}

func createRandomUniqueArray(_ start: Int, _ end: Int, _ count: Int) -> [Int] {
    var arr = (0..<count).map {_ in Int.random(in: start..<end)}
    arr = Array(Set(arr))
    
    while count > arr.count {
        let gap = count - arr.count
        let tmp: [Int] = (0..<gap).map {_ in Int.random(in: start..<end)}
        arr.append(contentsOf: tmp)
        arr = Array(Set(arr))
    }
    return arr
}