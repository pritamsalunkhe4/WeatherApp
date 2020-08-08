//
//  ViewUtility.swift
//  WeatherApp

import Foundation
import UIKit

class ViewUtility {
    
    //MARK: - Storyboards
    class private func getMainStoryBoard() -> UIStoryboard {
        return Storyboards.MAIN
    }
    
    //MARK: - ViewControllers
    class func getWeatherVC() -> WeatherViewController? {
        return getMainStoryBoard().instantiateViewController(
            withIdentifier: ViewControllers.WeatherViewController) as? WeatherViewController
    }
}
