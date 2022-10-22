func findIt(_ seq: [Int]) -> Int {
  var numToCount: [Int: Int] = [:]
  for elt in seq {
    numToCount[elt, default: 0] += 1
  }

  for (key, value) in numToCount {
    if value % 2 == 1 {
      return key
    }
  }
  return 0
}

func findIt(_ seq: [Int]) -> Int {
  seq.reduce(0, ^)
}