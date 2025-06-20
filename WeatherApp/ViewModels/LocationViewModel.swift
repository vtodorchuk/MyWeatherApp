//
//  LocationViewModel.swift
//  WeatherApp
//
//  Created by Vlady Todorchuk on 19.06.2025.
//

import Foundation
import CoreLocation
import Observation

@Observable
class LocationViewModel: NSObject, CLLocationManagerDelegate {
    var pinnedCities: [City] = []
    
    var currentUserLocation: CLLocationCoordinate2D?
    var currentCity: City?
    
    var isAlertShown: Bool = false
    var locationAuthorizationStatus: LocationAuthenticationStatus?
    var locationManager: CLLocationManager?
    
    private let geocoder = CLGeocoder()
    
    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
        } else {
            isAlertShown = true
            locationAuthorizationStatus = .denied
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorizationStatus()
    }
    
    func pinnedCity(city: City) {
        if let index = pinnedCities.firstIndex(where: { $0.id == city.id }) {
            pinnedCities.remove(at: index)
        } else {
            pinnedCities.append(city)
        }
    }
    
    private func checkLocationAuthorizationStatus() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            locationAuthorizationStatus = .restricted
            isAlertShown = true
        case .denied:
            locationAuthorizationStatus = .denied
            isAlertShown = true
        case .authorizedAlways, .authorizedWhenInUse:
            if let location = locationManager.location {
                currentUserLocation = location.coordinate
                fetchCity(from: location)
            }
        @unknown default:
            break
        }
    }
    
    private func fetchCity(from location: CLLocation) {
        geocoder.reverseGeocodeLocation(location) { [weak self] placemarks, error in
            guard let self = self else { return }
            
            if let error = error {
                print("Reverse geocoding failed: \(error.localizedDescription)")
                return
            }
            
            if let placemark = placemarks?.first {
                if let locality = placemark.locality, let state = placemark.country {
                    self.currentCity = City(name: locality, state: state, lon: location.coordinate.longitude, lat: location.coordinate.latitude)
                    print("Detected city: \(locality)")
                }
                
                print("Detected city: Unknown")
            }
        }
    }
}

enum LocationAuthenticationStatus {
    case restricted, denied
    
    func title() -> String {
        switch self {
            
        case .restricted:
            "Location Services is restricted"
        case .denied:
            "Location Services is denied"
        }
    }
    
    func message() -> String {
        switch self {
        case .restricted:
            "You can enable location services in Settings"
        case .denied:
            "You can enable location services in Settings"
        }
    }
}
