//
//  LocationManager.swift
//  WeatherApp

import Foundation
import CoreLocation

protocol LocationManagerDelegate: class {
    func currentCity(name: String)
}

class LocationManager: NSObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager?
    var geocoder: CLGeocoder?
    weak var delegate: LocationManagerDelegate?
    static let shared = LocationManager()
    
    private override init() {
        locationManager = CLLocationManager()
        geocoder = CLGeocoder()
    }
    
    func getCurrentCity() {
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("didUpdateToLocation: %@", locations);
        guard let location = locations.first else { return }
        geocoder?.reverseGeocodeLocation(location, completionHandler: { [weak self] (placemarks, error) in
            guard let placemark = placemarks?.first, let city = placemark.locality else { return }
            self?.delegate?.currentCity(name: city)
        })
    }    
}
