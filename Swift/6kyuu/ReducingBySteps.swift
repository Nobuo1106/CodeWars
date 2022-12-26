import Foundation

func som(_ x: Int, _ y: Int) -> (Int, String) {
    // your code
    let s = "som"
  return (x + y, s)
}
func maxi(_ x: Int, _ y: Int) -> (Int, String) {
    // your code
    let s = "maxi"
  return (max(x, y), s)
}
func mini(_ x: Int, _ y: Int) -> (Int, String) {
    // your code
    let s = "mini"
  return (min(x, y), s)
}
func gcdi(_ x: Int, _ y: Int) -> (Int, String) {
    // your code
    let s = "gcdi"
  return (abs(solveGCD(x, y)), s)
}
func lcmu(_ a: Int, _ b: Int) -> (Int, String) {
    // your code
    let s = "lcmu"
  return (abs(solveLCM(a, b)), s)
}

// replace the dots with a declaration of function
func operArray(_ f:(Int, Int)->(Int, String), _ a: [Int], _ iniVal: Int) -> [Int] {
    // your code
    var res:[Int] = []
    res.append(a[0])
    for i in 0..<a.count - 1   {
        let x = i >= 1 ? res[i] : a[i]
        let tuple = f(x, a[i + 1])
        res.append(tuple.0)
        if tuple.1 == "gcdi" || tuple.1 == "lcmu" {
            res[0] = abs(res[0])
        }
    }
    return res
}

func solveGCD(_ num1: Int, _ num2: Int) -> Int {
   let r = num1 % num2
   if r != 0 {
       return solveGCD(num2, r)
   } else {
       return num2
   }
}


// 最小公倍数 LCM(lowest common multiple)
func solveLCM(_ a: Int, _ b: Int) -> Int {
    if a == 0 || b == 0 {
        fatalError("Found zero value in the arguments")
    }

    let G = solveGCD(a, b)
    return a * b / G
}
