import UIKit

func executionTimeInterval(block: () -> ()) -> CFTimeInterval {
    let start = CACurrentMediaTime()
    block();
    let end = CACurrentMediaTime()
    return end - start
}

let countData = 125000
var data: [Double] = []
for _ in 0..<countData {
    let element = Double(arc4random())/1000
    data.append(element)
}

let time = executionTimeInterval {
    let countPrecision: Double = 1000
    let multiplier: Double = countPrecision*100
    let divider: Double = multiplier/100
    var sum: Double = 0
    for element in data {
        sum += element
    }
    for index in 0..<data.count {
        let percent = data[index]/sum*multiplier
        data[index] = Double(Int(percent+0.5))/divider
    }
}
print("time - \(time)")
print("\(data)")

