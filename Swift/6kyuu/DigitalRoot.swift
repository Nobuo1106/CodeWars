func digitalRoot(of number: Int) -> Int {
  return recursiveDigitalRoot(n: number)
}

func recursiveDigitalRoot(n: Int) -> Int {
  let str_list = Array(String(n))
  let int_list = str_list.compactMap { Int(String($0)) }
  let sum = int_list.reduce(0, +)
    if countDigits(n:sum) == 1 {
    print(sum)
    return sum
  } else {
    print(sum)
    return recursiveDigitalRoot(n: sum)
  }
}

func countDigits(n: Int)->Int{
   var count = 0
   var num = n
   if (num == 0){
      return 1
   }
 
   while (num > 0){
      num = num / 10
      count += 1
   }
   return count
}
