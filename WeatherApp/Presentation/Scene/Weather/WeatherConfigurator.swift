//
//  WeatherConfigurator.swift
//  WeatherApp

import Foundation

protocol WeatherConfigurator {
    func configure(view: WeatherView, cityName: String)
}

class WeatherConfiguratorImplementation: WeatherConfigurator {
    
    func configure(view: WeatherView, cityName: String) {
        let service = WeatherServiceImplementation()
        let usecase = WeatherUseCaseImplementation(service: service)
        let router = WeatherRouterImplementation(view: view)
        let presenter = WeatherPresenterImplementation(view: view, router: router, cityName: cityName, usecase: usecase)
        view.attachPresenter(presenter: presenter)
    }
}
