func rot(_ s: String) -> String {
  let a = String(s.reversed())
  return a
}
func selfieAndRot(_ s: String) -> String {
  print(s)
  let arr1 = s.components(separatedBy: "\n").map {$0 + String(repeating: ".", count: $0.count)}
  let arr2 = rot(s).components(separatedBy: "\n").map{String(repeating: ".", count: $0.count) + $0}
  let arr3 = arr1 + arr2
  return String(arr3.joined(separator: "\n"))
}
// replace the dots by your function parameter
func oper(_ f:(String) -> String, _ s:String) -> String {
  return f(s)
} 