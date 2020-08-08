//
//  WeatherRouter.swift
//  WeatherApp

import Foundation

protocol WeatherRouter {
    func navigateToBackScreen()
}

class WeatherRouterImplementation: WeatherRouter {
    var view: WeatherView?
    
    init(view: WeatherView) {
        self.view = view
    }
    
    func navigateToBackScreen() {
        view?.getNavigationController()?.popViewController(animated: true)
    }
}
