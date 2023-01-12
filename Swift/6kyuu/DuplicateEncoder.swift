import Foundation
func duplicateEncode(_ word: String) -> String {
    let lowerWord = word.lowercased()
    let nonDuplicateList:[String] = Array(Set(lowerWord)).map {String($0)}
    let duplicateList:[String] = Array(lowerWord).map {String($0)}
    var charCountList = [String: Int]()
    var ans = ""
    for i in 0..<nonDuplicateList.count {
        charCountList[nonDuplicateList[i]] = 0
    }
    for val in duplicateList {
        charCountList[val]! +=  1
    }
    for val in duplicateList {
        if charCountList[val]! > 1 {
            ans += ")"
        } else {
            ans += "("
        }
    }
    return ans
}