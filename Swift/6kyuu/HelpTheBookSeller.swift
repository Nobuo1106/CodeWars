func stockList(_ listOfArt: [String], _ listOfCat: [String]) -> String {
    var tuple: [(String, Int)] = []
    var total = 0; 
    listOfArt.forEach { element in
      let tmp = element.split(separator: " ")
        tuple.append((String(tmp[0]), Int(tmp[1])!))
    }
    var tuple2: [(String, Int)] = []
    listOfCat.forEach { element in
        tuple2.append((element,0))
    }
    for elem in tuple {
        for (i, value) in tuple2.enumerated(){
            let tmp = String(elem.0.prefix(1))
            if tmp == value.0 {
                tuple2[i].1 = value.1 + elem.1
              total += elem.1
            }
        }
    }
    if (total == 0) {
      return ""
    } 
    var res = ""
    for (key, elem) in tuple2.enumerated() {
        if (key == tuple2.count - 1) {
            res += "(\(elem.0) : \(elem.1))"
        } else {
            res += "(\(elem.0) : \(elem.1)) - "
        }
    }
    return res
}
