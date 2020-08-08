//
//  WeatherPresenter.swift
//  WeatherApp

import Foundation

protocol WeatherPresenter {
    func initialSetup()
    func fetchWeatherDetails()
    func backButtonAction()
    func numberOfRows() -> Int
    func getWeatherCellUIModel(for indexPath: IndexPath) -> WeatherDayUIModel?
    func getWeatherData() -> WeatherUIModel?
    func getCurrentLocation()
    func getCityName() -> String
}

class WeatherPresenterImplementation {
    var view: WeatherView?
    var router: WeatherRouter?
    var usecase: WeatherUseCase?
    var cityName: String
    var weatherUIModel: WeatherUIModel?
    
    init(view: WeatherView, router: WeatherRouter, cityName: String, usecase: WeatherUseCase) {
        self.view = view
        self.router = router
        self.usecase = usecase
        self.cityName = cityName
    }
}

extension WeatherPresenterImplementation: WeatherPresenter {
    func initialSetup() {
        view?.initialSetup()
        fetchWeatherDetails()
    }
    
    func getCityName() -> String {
        return cityName
    }
    
    func backButtonAction() {
        router?.navigateToBackScreen()
    }
    
    func getWeatherData() -> WeatherUIModel? {
        return weatherUIModel
    }
    
    func getWeatherCellUIModel(for indexPath: IndexPath) -> WeatherDayUIModel? {
        return weatherUIModel?.list?[indexPath.row]
    }
    
    func getCurrentLocation() {
        LocationManager.shared.delegate = self
        LocationManager.shared.getCurrentCity()
    }
    
    func fetchWeatherDetails() {
        view?.showActivityIndicator()
        usecase?.fetchData(cityName: cityName, completion: { [weak self] (isSuccess, response, error) in
            self?.view?.hideActivityIndicator()
            if isSuccess {
                guard let data = response else { return }
                self?.weatherUIModel = data
                self?.view?.reloadTableView()
            } else {
                self?.view?.showError(message: error.debugDescription)
                print("Error: \(String(describing: error))")
            }
        })
    }
    
    func numberOfRows() -> Int {
        return weatherUIModel?.list?.count ?? 0
    }
}

extension WeatherPresenterImplementation: LocationManagerDelegate {
    func currentCity(name: String) {
        cityName = name
        view?.updateCurrentLocation(cityName: cityName)
        fetchWeatherDetails()
    }
}
