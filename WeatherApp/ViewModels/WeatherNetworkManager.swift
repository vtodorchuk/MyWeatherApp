//
//  WeatherNetworkManager.swift
//  WeatherApp
//
//  Created by Vlady Todorchuk on 19.06.2025.
//

import Foundation
import CoreLocation

class WeatherNetworkManager: NetworkManager {
    let apiUrl = "https://api.openweathermap.org/data/2.5"
    
    func fetchCityForecast(lat: CLLocationDegrees, lon: CLLocationDegrees, completion: @escaping (ForecastResponse?) -> Void) {
        let url = "\(apiUrl)/weather?lat=\(lat)&lon=\(lon)&appid=\(self.weatherApiKey())"
        
        guard let url = URL(string: url) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error?.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = data else {
                print(error?.localizedDescription)
                completion(nil)
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(ForecastResponse.self, from: data)
                completion(decoded)
            } catch {
                print(error.localizedDescription)
                completion(nil)
            }
        }
        .resume()
    }
    
    func fetchDetailedForecast(lat: CLLocationDegrees, lon: CLLocationDegrees, cnt: Int, completion: @escaping (DetailedForecastResponse?) -> Void) {
        let url = "\(apiUrl)/forecast/daily?lat=\(lat)&lon=\(lon)&cnt=\(cnt)&appid=\(self.weatherApiKey())"
        
        print(url)
        
        guard let url = URL(string: url) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error?.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = data else {
                print(error?.localizedDescription)
                completion(nil)
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(DetailedForecastResponse.self, from: data)
                completion(decoded)
            } catch {
                print(error.localizedDescription)
                completion(nil)
            }
        }
        .resume()
    }
    
    private func weatherApiKey() -> String {
        if let apiKey = Bundle.main.object(forInfoDictionaryKey: "WEATHER_API_KEY") as? String {
            return apiKey
        } else {
            return ""
        }
    }
}

protocol NetworkManager {
    func fetchCityForecast(lat: CLLocationDegrees, lon: CLLocationDegrees, completion: @escaping (ForecastResponse?) -> Void)
    func fetchDetailedForecast(lat: CLLocationDegrees, lon: CLLocationDegrees, cnt: Int, completion: @escaping (DetailedForecastResponse?) -> Void)
}

