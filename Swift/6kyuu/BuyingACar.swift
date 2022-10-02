func nbMonths(_ startPriceOld: Int, _ startPriceNew: Int, _ savingPerMonth: Int, _ percentLossByMonth: Double) -> (Int, Int) {
  if (startPriceOld >= startPriceNew) {
    return (0, startPriceOld - startPriceNew)
  } else {
      let startPriceOld = Double(startPriceOld)
      let startPriceNew = Double(startPriceNew)
      let res = recursiveCalculationEveryMonth(startPriceOld, startPriceNew, savingPerMonth, percentLossByMonth, 0)
      print(res)
      let monthCount = res.count
      let remainder = Int(res.newPrice - res.oldPrice + Double(res.count) * Double(res.saving))
      return (monthCount, remainder)
  }
  return (0, 0)
}


func recursiveCalculationEveryMonth(_ startPriceOld: Double, _ startPriceNew: Double, _ savingPerMonth: Int, _ percentLossByMonth: Double, _ count: Int) -> (oldPrice: Double, newPrice: Double, saving:Int, percent:Double, count:Int) {
  let recursive_count = count + 1;
  let startPriceOld = decreaseCarPrice(price: startPriceOld, percent: percentLossByMonth)
  let startPriceNew = decreaseCarPrice(price: startPriceNew, percent: percentLossByMonth)
  let saving = recursive_count * savingPerMonth
  if startPriceOld + Double(saving) >= startPriceOld {
    return (startPriceOld, startPriceNew, saving, percentLossByMonth, recursive_count)
  } else {
    return recursiveCalculationEveryMonth(startPriceOld, startPriceNew, saving, percentLossByMonth, recursive_count)
  }
}

func decreaseCarPrice(price: Double, percent: Double) -> Double{
  return price * (100 - Double(percent)) / 100
}


