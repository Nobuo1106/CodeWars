func sumOfMinimums(_ numbers: [[Int]]) -> Int {
  var total = 0
  for nums in numbers {
    total += nums.min()!
  }
  return total
}