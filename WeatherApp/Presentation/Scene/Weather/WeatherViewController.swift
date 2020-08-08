//
//  WeatherViewController.swift
//  WeatherApp

import UIKit

protocol WeatherView {
    func initialSetup()
    func attachPresenter(presenter: WeatherPresenter)
    func getNavigationController() -> UINavigationController?
    func showActivityIndicator()
    func hideActivityIndicator()
    func showError(message: String)
    func reloadTableView()
    func updateCurrentLocation(cityName: String)
}

class WeatherViewController: UIViewController {

    @IBOutlet weak var weatherTableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherStatusLabel: UILabel!
    var presenter: WeatherPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.initialSetup()
    }
    
    @IBAction func backButtonAction(button: UIButton) {
        presenter?.backButtonAction()
    }
    
    @IBAction func locationButtonAction(button: UIButton) {
        presenter?.getCurrentLocation()
    }
    
    private func registerTableCells() {
        self.weatherTableView.register(UINib.init(nibName: CellConstant.WeatherTableViewCell, bundle: nil),
                                    forCellReuseIdentifier: CellConstant.WeatherTableViewCell)
    }
}

extension WeatherViewController: WeatherView {
    func initialSetup() {
        registerTableCells()
        titleLabel.text = presenter?.getCityName()
        weatherTableView.tableFooterView = UIView()
    }
    
    func attachPresenter(presenter: WeatherPresenter) {
        self.presenter = presenter
    }
    
    func getNavigationController() -> UINavigationController? {
        return self.navigationController
    }
    
    func showActivityIndicator() {
        self.view.activityStartAnimating()
    }
    
    func hideActivityIndicator() {
        self.view.activityStopAnimating()
    }
    
    func showError(message: String) {
        self.view.showAlert(title: "Error", message: message)
    }
    
    func reloadTableView() {
        if let model = presenter?.getWeatherData() {
            temperatureLabel.text = WeatherUtility.kelvinToCelcius(temp: model.temp)
            weatherStatusLabel.text = model.weatherStatus?.capitalizedFirst
        }
        weatherTableView.reloadData()
    }
    
    func updateCurrentLocation(cityName: String) {
        titleLabel.text = cityName
    }
}

extension WeatherViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let weatherCell = tableView.dequeueReusableCell(withIdentifier:
            CellConstant.WeatherTableViewCell) as? WeatherTableViewCell, let cellModel = presenter?.getWeatherCellUIModel(for: indexPath) {
            
            weatherCell.configureCell(cellModel: cellModel)
            weatherCell.selectionStyle = .none
            return weatherCell
        } else {
            let defaultCell = WeatherTableViewCell.init(style: .default, reuseIdentifier: nil)
            return defaultCell
        }
    }
}
