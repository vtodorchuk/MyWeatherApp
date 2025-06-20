//
//  ForecastViewModel.swift
//  WeatherApp
//
//  Created by Vlady Todorchuk on 19.06.2025.
//

import Foundation
import CoreLocation

@Observable
class ForecastViewModel {
    var networkmanager: NetworkManager
    
    var forecast: ForecastResponse?
    var detailedForecast: DetailedForecastResponse?
    
    init(networkmanager: NetworkManager) {
        self.networkmanager = networkmanager
    }
    
    func getCityForecast(lat: CLLocationDegrees, lon: CLLocationDegrees) {
        networkmanager.fetchCityForecast(lat: lat, lon: lon) { forecast  in
            DispatchQueue.main.async {
                if let forecast = forecast {
                    self.forecast = forecast
                    print("Weather for City API CALL:\(forecast)\n\n")
                }
            }
        }
    }
    
    func getDetailedForecast(lat: CLLocationDegrees, lon: CLLocationDegrees) {
        networkmanager.fetchDetailedForecast(lat: lat, lon: lon, cnt: 16) { forecast in
            DispatchQueue.main.async {
                if let forecast = forecast {
                    self.detailedForecast = forecast
                    print("Weather for Details API CALL:\(forecast)\n\n")
                }
            }
        }
    }
}
