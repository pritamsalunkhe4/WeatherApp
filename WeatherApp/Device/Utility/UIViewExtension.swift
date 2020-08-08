//
//  UIViewExtension.swift
//  WeatherApp

import Foundation
import UIKit

extension UIView {
    
    /// A property that accesses the backing layer's shadow
    @IBInspectable
    open var shadowColor: UIColor? {
        get {
            guard let v = layer.shadowColor else {
                return nil
            }
            
            return UIColor(cgColor: v)
        }
        set(value) {
            layer.shadowColor = value?.cgColor
        }
    }
    
    /// A property that accesses the backing layer's shadowOffset.
    @IBInspectable
    open var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set(value) {
            layer.shadowOffset = value
        }
    }
    
    /// A property that accesses the backing layer's shadowOpacity.
    @IBInspectable
    open var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set(value) {
            layer.shadowOpacity = value
        }
    }
    
    /// A property that accesses the backing layer's shadowRadius.
    @IBInspectable
    open var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set(value) {
            layer.shadowRadius = value
        }
    }
    
    /// A property that accesses the backing layer's shadowPath.
    @IBInspectable
    open var shadowPath: CGPath? {
        get {
            return layer.shadowPath
        }
        set(value) {
            layer.shadowPath = value
        }
    }
    
    /// A property that accesses the layer.cornerRadius.
    @IBInspectable
    open var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set(value) {
            layer.cornerRadius = value
        }
    }
    
    /// A property that accesses the layer.borderWith.
    @IBInspectable
    open var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set(value) {
            layer.borderWidth = value
        }
    }
    
    /// A property that accesses the layer.borderColor property.
    @IBInspectable
    open var borderColor: UIColor? {
        get {
            guard let v = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: v)
        }
        set(value) {
            layer.borderColor = value?.cgColor
        }
    }
    
    func activityStartAnimating() {
        if let window  = UIApplication.shared.keyWindow {
            let indicatorView = UIView()
            indicatorView.backgroundColor = UIColor.clear
            indicatorView.frame = CGRect(x: 0, y: 0, width: DeviceUtility.SCREEN_SIZE.width,
                                         height: DeviceUtility.SCREEN_SIZE.height)
            indicatorView.tag = 789789
            let activityIndicator =  UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
            activityIndicator.center = window.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.startAnimating()
            indicatorView.addSubview(activityIndicator)
            window.viewWithTag(789789)?.removeFromSuperview()
            window.addSubview(indicatorView)
        }
    }
    
    func activityStopAnimating() {
        if let window = UIApplication.shared.keyWindow {
            window.viewWithTag(789789)?.removeFromSuperview()
        }
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.window?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
}
