//
//  WeatherMapper.swift
//  WeatherApp

import Foundation

struct WeatherMapper {
    func getWeatherDataURL(cityName: String, apiUrl: String) -> String {
        return String(format: apiUrl, cityName, Keys.API_KEY)
    }
    
    func getWeatherUIModel(from response: WeatherAPIResponseModel?) -> WeatherUIModel? {
        guard let data = response else { return nil }
        var weatherUIModel = WeatherUIModel()
        
        weatherUIModel.city = data.city
        if let list = data.list {
            var formattedDate: String = ""
            var listArray = [WeatherDayUIModel]()
            for weatherData in list {
                let weatherDate = Date.getFormattedDate(from: weatherData.dt ?? 0)
                if formattedDate != weatherDate {
                    formattedDate = weatherDate
                    if weatherDate == Date.getFormattedDate(from: Date().timeIntervalSince1970) {
                        weatherUIModel.temp = weatherData.main?.temp
                        weatherUIModel.weatherStatus = weatherData.weather?.first?.description
                    }
                    var weatherDayUIModel = WeatherDayUIModel()
                    weatherDayUIModel.day = weatherDate
                    weatherDayUIModel.tempData = weatherData.main
                    weatherDayUIModel.weatherData = weatherData.weather?.first
                    weatherDayUIModel.windData = weatherData.wind
                    
                    listArray.append(weatherDayUIModel)
                }
            }
            weatherUIModel.list = listArray
        }
        
        return weatherUIModel
    }
}
