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
    
    init(networkmanager: NetworkManager) {
        self.networkmanager = networkmanager
    }
    
    func getCityForecast(lat: CLLocationDegrees, lon: CLLocationDegrees, completion: @escaping (ForecastResponse?) -> Void) async {
        do {
            let result = try await networkmanager.fetchCityForecast(lat: lat, lon: lon)
            completion(result)
        } catch {
            print("Error fetching city forecast:", error.localizedDescription)
            completion(nil)
        }
    }
    
    func getDetailedForecast(lat: CLLocationDegrees, lon: CLLocationDegrees, completion: @escaping (DetailedForecastResponse?) -> Void) async {
        do {
            let result = try await networkmanager.fetchDetailedForecast(lat: lat, lon: lon, cnt: 16)
            completion(result)
        } catch {
            print("Error fetching detailed forecast:", error.localizedDescription)
            completion(nil)
        }
    }
}
