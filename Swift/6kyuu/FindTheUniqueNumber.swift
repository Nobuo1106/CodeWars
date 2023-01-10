func findUniq(_ arr: [Int]) -> Int {
    let array = arr
    let UniqueEArray = Array(Dictionary(grouping: array) {$0}.filter {$0.value.count == 1}.keys)
    return UniqueEArray[0]
}