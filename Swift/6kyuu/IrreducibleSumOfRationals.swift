func sumFracts(_ l: [(Int, Int)]) -> (Int, Int)? {
  if l.isEmpty{
    return nil
  }
  var list:[Int] = []
   for (_, value) in l{
     list.append(value)
   }
  let lcm = solveLCM(numbers:list)
  var molecule = 0
  var list2:[Int] = []
  for (_, value) in l{
     list2.append(lcm / value)
   }
  
  for (i, value) in list2.enumerated() {
    molecule += value * l[i].0
  }
  return (reduce(mole: molecule, deno: lcm))
}

func solveGCD(_ num1: Int, _ num2: Int) -> Int {
   let r = num1 % num2
   if r != 0 {
       return solveGCD(num2, r)
   } else {
       return num2
   }
}

func solveGCD(numbers numbers_: Int...) -> Int {
    if numbers_.count < 2 {
        fatalError("No enough arguments")
    }
    var numbers = numbers_
    while numbers.count != 2 {
        numbers[1] = solveGCD(numbers[0], numbers[1])
        numbers.remove(at: 0)
    }
    return solveGCD(numbers[0], numbers[1])
}

/// 最小公倍数 LCM(lowest common multiple)
func solveLCM(_ a: Int, _ b: Int) -> Int {
    if a == 0 || b == 0 {
        fatalError("Found zero value in the arguments")
    }

    let G = solveGCD(a, b)
    return a * b / G
}

func solveLCM(numbers numbers_: [Int]) -> Int {
    if numbers_.count < 2 {
        fatalError("No enought arguments")
    }
    var numbers = numbers_
    while numbers.count != 2 {
        numbers[1] = solveLCM(numbers[0], numbers[1])
        numbers.remove(at: 0)
    }
    return solveLCM(numbers[0], numbers[1])
}

func reduce(mole: Int, deno: Int) -> (Int, Int) {
  func gcd(_ a: Int, _ b: Int) -> Int {
    switch b {
    case 0:
      return a
    default:
      return gcd(b, a % b)
    }
  }
  let r = gcd(mole, deno)
  return (mole/r, deno/r)
}