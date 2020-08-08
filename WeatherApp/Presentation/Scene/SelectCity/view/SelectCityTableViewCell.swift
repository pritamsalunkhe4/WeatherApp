//
//  SelectCityTableViewCell.swift
//  WeatherApp

import UIKit

class SelectCityTableViewCell: UITableViewCell {

    @IBOutlet weak var cityNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureCell(cityName: String?) {
        cityNameLabel.text = cityName
    }
}
