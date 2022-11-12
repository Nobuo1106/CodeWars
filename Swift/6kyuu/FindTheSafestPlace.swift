import Foundation
func advice(agents: [[Int]], n: Int) -> [[Int]] {
    let agents = agents.filter({ $0[0] < n && $0[1] < n })
    print(agents)
    print(n)
    guard n > 0 else { return [] }
    var map = creatingMap(n: n)
    var max:Int = 0
    var dist_map:[[Int]] = []
    var is_agent = false
    for (a, value)in map.enumerated() {
        for arr in agents {
            if arr[0] > n || arr[1] > n {
              continue;
            }
            is_agent = true
            let gap = abs(value.0 - arr[0]) + abs(value.1 - arr[1])
            if let third_prm = map[a].2 {
                if gap < third_prm {
                    map[a].2 = gap
                }
            } else {
                map[a].2 = gap
            }
        }
    }
    if is_agent == false {
        var m:[[Int]] = []
        for i in 0..<n {
            for j in 0..<n {
                m.append([i, j])
            }
        }
        return m
    }
    for i in map {
        max = i.2! > max ? i.2! : max
    }
    if max == 0 {
      return []
    }
    
    for value in map {
        if value.2 == max {
            dist_map.append([value.0, value.1])
        }
    }
    return dist_map
}

func creatingMap(n: Int) -> [(Int, Int, Int?)]{
    var map = [(Int, Int, Int?)]()
    for i in 0..<n {
        for j in 0..<n {
            map.append((i, j, nil))
        }
    }
    return map
}