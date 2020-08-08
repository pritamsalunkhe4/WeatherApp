//
//  WeatherModel.swift
//  WeatherApp

import Foundation

struct WeatherAPIResponseModel: Decodable {
    var cod: String?
    var city: CityAPIModel?
    var list: [WeatherDataModel]?
}

struct CityAPIModel: Decodable {
    var id: Int?
    var name: String?
}

struct WeatherDataModel: Decodable {
    var dt: Double?
    var main: TemperatureModel?
    var weather: [WeatherData]?
    var wind: WindData?
}

struct TemperatureModel: Decodable {
    var temp: Double?
    var temp_min: Double?
    var temp_max: Double?
    var pressure: Int?
    var humidity: Int?
}

struct WeatherData: Decodable {
    var main: String?
    var description: String?
}

struct WindData: Decodable {
      var speed: Double?
      var deg: Int?
}

struct WeatherUIModel {
    var temp: Double?
    var weatherStatus: String?
    var city: CityAPIModel?
    var list: [WeatherDayUIModel]?
}

struct WeatherDayUIModel {
    var day: String?
    var tempData: TemperatureModel?
    var weatherData: WeatherData?
    var windData: WindData?
}
