import Foundation;
func validBraces(_ s:String) -> Bool{
    print(s)
    let open = [
        "(",
        "[",
        "{"
    ]
    
    let close = [
        ")",
        "]",
        "}"
    ]
    
    let split = Array(s)
    var nextClose:[String] = []
    var isClose = false
    
    for v in split {
        if let openIdx = open.firstIndex(of: String(v)) {
            nextClose.append(close[openIdx])
        }
        if close.firstIndex(of: String(v)) != nil{
            if String(v) != nextClose.last {
                return false
            } else {
                nextClose.removeLast()
                isClose = true
            }
        }
    }
    return isClose ? true : false
}