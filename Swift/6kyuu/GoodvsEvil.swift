import Foundation

func evaluate(good: String, vsEvil evil: String) -> String {
  
  let g: Int = calcTotal(good)
  let e: Int = calcTotal(evil)
    
  if g > e {
      return "Battle Result: Good triumphs over Evil"
  } else if e > g {
      return "Battle Result: Evil eradicates all trace of Good"
  } else {
      return "Battle Result: No victor on this battle field"
  }
}

func calcTotal(_ st: String) -> Int {
    var array:[Int] = st.components(separatedBy: " ").map{ Int($0) ?? 0 }
    let goodScore:[Int] = [1, 2, 3, 3, 4, 10]
    let evilScore:[Int] = [1, 2, 2, 2, 3, 5, 10]
    var temp:[Int] = []
    let cnt = array.count
    
    for i in 0..<cnt {
        if cnt == 6 {
            temp.append(array[i] * goodScore[i])
            print(i)
        } else {
            temp.append(array[i] * evilScore[i])
        }
    }
    let sum = temp.reduce(0, +)
    return sum
}