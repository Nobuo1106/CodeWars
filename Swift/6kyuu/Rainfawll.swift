func mean(_ d : String, _ town: String) -> Double {
  var array:[String] = d.components(separatedBy: "\n")
  if let firstIndex = array.firstIndex(where: {$0.contains(town)}) {
      var index = array[firstIndex].firstIndex(of: ":")
      var ind = index?.utf16Offset(in: array[firstIndex])
      
      let d_str =  String(array[firstIndex].dropFirst(ind! + 1))
      let d_list = d_str.components(separatedBy: ",").map {Double($0.dropFirst(4))!} 
      return average(d_list)
  }
    return 0.0
}

func variance(_ d : String, _ town: String) -> Double {
  var array:[String] = d.components(separatedBy: "\n")
  if let firstIndex = array.firstIndex(where: {$0.contains(town)}) {
      var index = array[firstIndex].firstIndex(of: ":")
      var ind = index?.utf16Offset(in: array[firstIndex])
      
      let d_str =  String(array[firstIndex].dropFirst(ind! + 1))
      let d_list = d_str.components(separatedBy: ",").map {Double($0.dropFirst(4))!} 
      return bunsan(d_list)
  }
    return 0.0
}

func sum(_ array:[Double])->Double{
    return array.reduce(0,+)
}

func average(_ array:[Double])->Double{
    return sum(array) / Double(array.count)
}

func bunsan(_ array:[Double])->Double{
    let left=average(array.map{pow($0, 2.0)})
    let right=pow(average(array), 2.0)
    let count=array.count
    return (left-right)*Double(count/(count-1))
}
