//
//  DeviceUtility.swift
//  WeatherApp

import Foundation
import UIKit

class DeviceUtility {
    
    class func getStatusBarFrame() -> CGRect {
        var statusBarFrame: CGRect
        if #available(iOS 13.0, *) {
            let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            statusBarFrame = window?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero
        } else {
            statusBarFrame = UIApplication.shared.statusBarFrame
        }
        return statusBarFrame
    }
    
    static var SCREEN_SIZE: CGRect = UIScreen.main.bounds
}
