func camelCase(_ str: String) -> String {
  return str.capitalized.replacingOccurrences(of: " ", with: "")
}