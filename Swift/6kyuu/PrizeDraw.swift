import Foundation

func rank(_ st: String, _ we: [Int], _ n: Int) -> String {
  if st.isEmpty {
    return "No participants"
  }
  let romanStrs:[String] = st.components(separatedBy: ",")
  let romanNums = we
  
  if romanStrs.count != romanNums.count {
    return "Not enough participants"
  }
  if n > romanStrs.count {
    return "Not enough participants"
  }
  var total = [Int]()
  for (i, v) in romanStrs.enumerated() {
      let a = stringToAsciiInt(v)
      var t = a.reduce(0, +)
      t = t + v.count
      t = t * romanNums[i]
      total.append(t)
  }
let dic = zip(romanStrs, total).reduce(into: [String: Int]()) { $0[$1.0] = $1.1 }
var sort = dic.sorted {$0.0 < $1.0}
 sort =  sort.sorted { $0.1 > $1.1 }


for (i, element) in sort.enumerated() {
    if i + 1 == n {
//         print(element.key)
        return element.key
    }
}

  return ""

}

func stringToAsciiInt(_ str: String) -> [Int] {
    var array:[Int] = []
    let cstr:[CChar] = str.cString(using: .ascii)!
    for cchar in cstr {
        if cchar >= 65 && cchar <= 90 {
            array.append(Int(cchar) - 64)
        } else if cchar >= 97 && cchar <= 122 {
            array.append(Int(cchar) - 96)
        }
    }
    return array
}

func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    var nums = nums, start = 0, end = nums.count
    
    while true {
        let pivotIndex = Int.random(in: start..<end)
        let pivot = nums[pivotIndex]
        
        nums.swapAt(pivotIndex, start)
        let partitionEnd = nums[start+1..<end].partition { $0 < pivot }
        nums.swapAt(start, partitionEnd-1)
        
        if partitionEnd < k      { start = partitionEnd }
        else if partitionEnd > k { end = partitionEnd - 1 }
        else                     { return nums[k-1] }
    }
}