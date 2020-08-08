//
//  WeatherUtility.swift
//  WeatherApp

import Foundation

class WeatherUtility {
    class func kelvinToCelcius(temp: Double?) -> String {
        var celcius = ""
        if let temp = temp {
            let celciusValue = (temp - 273.15).rounded(toPlaces: 1)
            celcius = String(celciusValue) + "°"
        }
        return celcius
    }
}

extension Double {
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

extension StringProtocol {
    var capitalizedFirst: String { return prefix(1).capitalized + dropFirst() }
}
