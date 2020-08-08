//
//  SelectCityViewController.swift
//  WeatherApp

import UIKit

protocol SelectCityView {
    func initialSetup()
    func attachPresenter(presenter: WeatherPresenter)
    func getNavigationController() -> UINavigationController?
    func reloadTableView()
}

class SelectCityViewController: UIViewController {

    @IBOutlet weak var cityTableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    var presenter: SelectCityPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let router = SelectCityRouterImplementation(view: self)
        presenter = SelectCityPresenterImplementation(view: self, router: router) 
        presenter?.initialSetup()
    }
    
    private func registerTableCells() {
        self.cityTableView.register(UINib.init(nibName: CellConstant.SelectCityCell, bundle: nil),
                                    forCellReuseIdentifier: CellConstant.SelectCityCell)
    }
    
    @IBAction func addButtonAction(button: UIButton) {
        showAddCityPopup()
    }
    
    func showAddCityPopup() {
        let alertController = UIAlertController(title: "Add City", message: nil, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let confirmAction = UIAlertAction(title: "Add", style: .default) { [weak self] (_) in
            if let txtField = alertController.textFields?.first, let text = txtField.text, !text.isEmpty {
                self?.presenter?.addCity(name: text)
            }
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "city name"
        }
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension SelectCityViewController: SelectCityView {
    func initialSetup() {
        titleLabel.text = "Select City"
        registerTableCells()
        cityTableView.tableFooterView = UIView()
    }
    
    func attachPresenter(presenter: WeatherPresenter) {
        
    }
    
    func getNavigationController() -> UINavigationController? {
        return self.navigationController
    }
    
    func reloadTableView() {
        cityTableView.reloadData()
    }
}

extension SelectCityViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cityCell = tableView.dequeueReusableCell(withIdentifier:
            CellConstant.SelectCityCell) as? SelectCityTableViewCell {
            
            cityCell.configureCell(cityName: presenter?.getCityName(for: indexPath))
            cityCell.selectionStyle = .none
            return cityCell
        } else {
            let defaultCell = SelectCityTableViewCell.init(style: .default, reuseIdentifier: nil)
            return defaultCell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.tableViewDidSelectAt(indexPath: indexPath)
    }
}
