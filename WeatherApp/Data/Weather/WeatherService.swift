//
//  WeatherService.swift
//  WeatherApp

import Foundation
import Alamofire

protocol WeatherService {
    func fetchData(cityName: String, completion: @escaping CompletionHandler)
}

class WeatherServiceImplementation: SessionDelegate, WeatherService {
    
    var jsonDecoder = JSONDecoder()
    
    //Make an API call and returns the completion with model data
    func fetchData(cityName: String, completion: @escaping CompletionHandler) {
        let mapper = WeatherMapper()
        let apiUrl = mapper.getWeatherDataURL(cityName: cityName, apiUrl: URLManager.API_URL)
        guard let url = URL(string: apiUrl) else { return }
        
        Alamofire.request(url, method: .get, parameters: nil, headers: APIHeader.getHeader())
            .responseString(completionHandler: { [weak self] (responseString) in
                
                switch responseString.result {
                case .success(let string):
                    print(responseString)
                    do {
                        guard let data = string.data(using: .utf8) else {
                            completion(false, nil, responseString.result.error)
                            return }
                        let response = try self?.jsonDecoder.decode(WeatherAPIResponseModel.self, from: data)
                        let uiModel = mapper.getWeatherUIModel(from: response)
                        completion(true, uiModel, nil)
                        
                    } catch let error {
                        completion(false, nil, error as NSError)
                    }
                    
                case .failure(let error):
                    completion(false, nil, error)
                }
            })
    }
}
