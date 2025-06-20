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
    
    func fetchCityForecast(lat: CLLocationDegrees, lon: CLLocationDegrees) async throws -> ForecastResponse {
        let urlString = "\(apiUrl)/weather?lat=\(lat)&lon=\(lon)&appid=\(self.weatherApiKey())"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(ForecastResponse.self, from: data)
    }
    
    func fetchDetailedForecast(lat: CLLocationDegrees, lon: CLLocationDegrees, cnt: Int) async throws -> DetailedForecastResponse {
        let urlString = "\(apiUrl)/forecast/daily?lat=\(lat)&lon=\(lon)&cnt=\(cnt)&appid=\(self.weatherApiKey())"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(DetailedForecastResponse.self, from: data)
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
    func fetchCityForecast(lat: CLLocationDegrees, lon: CLLocationDegrees) async throws -> ForecastResponse
    func fetchDetailedForecast(lat: CLLocationDegrees, lon: CLLocationDegrees, cnt: Int) async throws -> DetailedForecastResponse
}

