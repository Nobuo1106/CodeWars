import Foundation

func nbMonths(_ startPriceOld: Int, _ startPriceNew: Int, _ savingPerMonth: Int, _ percentLossByMonth: Double) -> (Int, Int) {
  if (startPriceOld >= startPriceNew) {
    return (0, startPriceOld - startPriceNew)
  } else {
      let startPriceOld = Double(startPriceOld)
      let startPriceNew = Double(startPriceNew)
      let res = recursiveCalculationEveryMonth(startPriceOld, startPriceNew, savingPerMonth, percentLossByMonth, 0)
      let monthCount = res.count
      print(abs(res.newPrice - res.oldPrice - Double(res.saving)))
      let remainder = Int(round(abs(res.newPrice - res.oldPrice - Double(res.saving))))
      return (monthCount, remainder)
  }
}


func recursiveCalculationEveryMonth(_ startPriceOld: Double, _ startPriceNew: Double, _ savingPerMonth: Int, _ percentLossByMonth: Double, _ count: Int) -> (oldPrice: Double, newPrice: Double, saving:Int, percent:Double, count:Int) {
  let recursive_count = count + 1;
  let percent = calculateDepreciationPercent(percentLossByMonth, recursive_count)
  let startPriceOld = decreaseCarPrice(price: startPriceOld, percent: percent, month: recursive_count)
  let startPriceNew = decreaseCarPrice(price: startPriceNew, percent: percent, month: recursive_count)
  let saving = recursive_count * savingPerMonth
  if startPriceOld + Double(saving) >= startPriceNew {
    return (startPriceOld, startPriceNew, saving, percent, recursive_count)
  } else {
    return recursiveCalculationEveryMonth(startPriceOld, startPriceNew, savingPerMonth, percent, recursive_count)
  }
}

func decreaseCarPrice(price: Double, percent: Double, month: Int) -> Double{
    return price * (100 - Double(percent)) / 100
}

func calculateDepreciationPercent(_ percent: Double, _ month: Int) -> Double {
    if month % 2 == 0 {
        return percent + 0.5
    } else {
        return percent
    }
}