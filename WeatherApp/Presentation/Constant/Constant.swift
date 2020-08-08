//
//  Constant.swift
//  WeatherApp

import Foundation
import UIKit

struct StoryboardsNameConstant {
    static let MAIN = "Main"
}

struct Storyboards {
    static let MAIN = UIStoryboard.init(name: StoryboardsNameConstant.MAIN, bundle: nil)
}

struct ViewControllers {
    static let WeatherViewController = "WeatherViewController"
}

struct CellConstant {
    static let SelectCityCell = "SelectCityTableViewCell"
    static let WeatherTableViewCell = "WeatherTableViewCell"
}

struct URLManager {
    static let API_URL = "http://api.openweathermap.org/data/2.5/forecast?q=%@&appid=%@"
}

struct APIHeader {
    static func getHeader() -> [String: String]? {
        var header = [String: String]()
        header["Content-Type"] = "application/json"
        return header
    }
}

struct Keys {
    static let API_KEY = "5ac08a9955fcc4211d4bb3e45d55ae3a"
}

enum DateFormats: String {
    case longDay = "EEEE, dd"
    case shortenedMonth = "MMM dd, yyyy"
}
