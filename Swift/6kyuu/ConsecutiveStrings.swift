func longestConsec(_ strarr: [String], _ k: Int) -> String {
    print(strarr)
    if strarr.count < 1 || strarr.count < k || k <= 0 {
        return ""
    }
    var tmp: [String] = []
    var str: String = ""
    for i in 0..<strarr.count - k + 1{
        str += strarr[i]
        for j in 0..<k - 1{
            str += strarr[i + j + 1]
        }
        tmp.append(str)
        str = ""
    }
    print(tmp)

    if let max = tmp.max(by: {$1.count > $0.count}) {
        return max
    }
    return ""
}