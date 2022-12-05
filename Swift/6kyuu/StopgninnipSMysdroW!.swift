import Foundation

func spinWords(in sentence: String) -> String {
    var arr: [String] = sentence.components(separatedBy: " ")
    for (key, value) in arr.enumerated() {
        if value.count >= 5 {
        arr[key] = String(value.reversed())
        }
    }
    let join = arr.joined(separator : " ")
    return join
}
