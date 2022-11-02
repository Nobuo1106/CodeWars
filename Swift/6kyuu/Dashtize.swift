import Foundation

func dashatize(_ number: Int) -> String {
    if number == 0 {
      return "0"
    }
    let n = abs(number)
    let a = "\(n)".compactMap { Int("\($0)") }
    if a.count == 1 {
      return String(a[0])
    }
  
    var s: String = ""
    for (key, value) in a.enumerated() {
      let isCurrentEven = value % 2 == 0 ||  value % 2 == 0 ? true : false
      
      if !a.indices.contains(key + 1) {
        let isPrevEven = a[key - 1] % 2 == 0 || a[key - 1] % 2 == 0 ? true : false
        if isCurrentEven && isPrevEven {
          s += "\(value)"
        } else {
          s += "-\(value)"
        }
        break
      }
      let isNextEven = a[key + 1] % 2 == 0 || a[key + 1] % 2 == 0 ? true : false
      if (!isCurrentEven
      || !isNextEven)
      && key < a.count - 2 {
        s += "\(value)-"
      } else {
        s += String(value)
      }
    }
  return s
}