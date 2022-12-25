import Foundation;
//Use Double.pi for the mathematical value of pi in your calculations if necessary.

func areaOfPolygonInsideCircle(_ circleRadius: Double, _ numberOfSides: Int) -> Double {
    if (circleRadius < 0 && numberOfSides < 0) {
      return -1;
    }

    let A = (circleRadius * circleRadius * Double(numberOfSides) * sin((360.0 / Double(numberOfSides) * Double.pi / 180.0))) / 2.0

    return round(A*1000)/1000;
}