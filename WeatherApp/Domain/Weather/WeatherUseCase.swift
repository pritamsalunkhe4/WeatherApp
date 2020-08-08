//
//  WeatherUseCase.swift
//  WeatherApp

import Foundation

typealias CompletionHandler = (_ success: Bool, _ data: WeatherUIModel?, _ error: Error?) -> Void

protocol WeatherUseCase {
    func fetchData(cityName: String, completion: @escaping CompletionHandler)
}

class WeatherUseCaseImplementation: WeatherUseCase {
    private var service: WeatherService?
    
    init(service: WeatherService) {
        self.service = service
    }
    
    func fetchData(cityName: String, completion: @escaping CompletionHandler) {
        service?.fetchData(cityName: cityName, completion: completion)
    }
}
