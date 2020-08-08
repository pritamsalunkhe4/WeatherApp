//
//  SelectCityPresenter.swift
//  WeatherApp

import Foundation

protocol SelectCityPresenter {
    func initialSetup()
    func addCity(name: String)
    func getCityName(for indexPath: IndexPath) -> String?
    func numberOfRows() -> Int
    func tableViewDidSelectAt(indexPath: IndexPath)
}

class SelectCityPresenterImplementation {
    
    var view: SelectCityView?
    var router: SelectCityRouter?
    
    var cityList: [String] = ["Nashik", "Pune", "Mumbai", "Nagpur", "Delhi", "Kolkata", "Chennai"]
    
    init(view: SelectCityView, router: SelectCityRouter) {
        self.view = view
        self.router = router
    }
}

extension SelectCityPresenterImplementation: SelectCityPresenter {
    func initialSetup() {
        view?.initialSetup()
    }
    
    func numberOfRows() -> Int {
        return cityList.count
    }
    
    func addCity(name: String) {
        cityList.append(name)
        view?.reloadTableView()
    }
    
    func getCityName(for indexPath: IndexPath) -> String? {
        return cityList[indexPath.row]
    }
    
    func tableViewDidSelectAt(indexPath: IndexPath) {
        router?.navigateToWeatherScreen(cityName: cityList[indexPath.row])
    }
}
