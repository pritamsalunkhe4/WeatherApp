//
//  WeatherTableViewCell.swift
//  WeatherApp

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureCell(cellModel: WeatherDayUIModel) {
        dayLabel.text = cellModel.day
        weatherLabel.text = cellModel.weatherData?.description?.capitalizedFirst
        let minTemp = WeatherUtility.kelvinToCelcius(temp: cellModel.tempData?.temp_min)
        let maxTemp = WeatherUtility.kelvinToCelcius(temp: cellModel.tempData?.temp_max)
        tempLabel.text = minTemp + " - " + maxTemp
        humidityLabel.text = String(cellModel.tempData?.humidity ?? 0) + "%"
        windLabel.text = String(cellModel.windData?.speed ?? 0) + "m/s"
        pressureLabel.text = String(cellModel.tempData?.pressure ?? 0) + "hPa"
    }

}
