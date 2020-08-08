//
//  DateExtension.swift
//  WeatherApp

import Foundation

extension Date {
    static func getFormattedDate(from timeStamp: Double, format: String = DateFormats.longDay.rawValue) -> String  {
        _ = Date()
        let date = Date(timeIntervalSince1970: timeStamp)
        
        let calendar = Calendar.current
        if calendar.isDateInToday(date) {
            return "Today"
        } else if calendar.isDateInTomorrow(date) {
            return "Tomorrow"
        } else {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = format
            return dateFormatter.string(from: date)
        }
    }
}
