import Foundation
func isAValidMessage(_ message: String) -> Bool {
//    print(message)
    if message == "" {
        return true
    }
    var strarr = Array(message).map {String($0)}
    while 0 < strarr.count {
        if Int(strarr[0]) != nil {
            let numOfChar = reduceInt(strarr)
            print(numOfChar)
            strarr.removeFirst(String(numOfChar).count)
            if !validate(strarr, numOfChar) {
                return false
            }
            strarr.removeFirst(numOfChar)
        } else {
            strarr.removeFirst()
        }
//        print(i)
    }
    return true
}

func reduceInt(_ strarr: [String]) -> Int{
    var strN: String = strarr[0]
    var arr = strarr
    arr.removeFirst()
    for val in arr {
        if  ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"].contains(val) {
            strN += val
        } else {
            return Int(strN)!
        }
    }
    return Int(strN)!
}

func validate(_ strarr: [String], _ n: Int) -> Bool {
//    print(strarr)
    //文字数は足りているか
    if strarr.count < n {
        return false
    }
    //数字が含まれていないか
    for i in 0..<n - 1 {
        if  ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"].contains(strarr[i]) {
//            print(i)
            return false
        }
    }
    //区切り文字の次の文字があるか、ある場合は数字か
    if strarr.count > n + 1 {
        if !["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"].contains(strarr[n]) {
//            print(n)
//            print(strarr[n])
            return false
        }
    }
    return true
}