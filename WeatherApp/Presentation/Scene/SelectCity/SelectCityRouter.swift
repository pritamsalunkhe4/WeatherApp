//
//  SelectCityRouter.swift
//  WeatherApp

import Foundation

protocol SelectCityRouter {
    func navigateToWeatherScreen(cityName: String)
}

class SelectCityRouterImplementation: SelectCityRouter {
    
    var view: SelectCityView?
    
    init(view: SelectCityView) {
        self.view = view
    }
    
    func navigateToWeatherScreen(cityName: String) {
        if let weatherVC = ViewUtility.getWeatherVC() {
            let configurator = WeatherConfiguratorImplementation()
            configurator.configure(view: weatherVC, cityName: cityName)
            view?.getNavigationController()?.pushViewController(weatherVC, animated: true)
        }
    }
}
