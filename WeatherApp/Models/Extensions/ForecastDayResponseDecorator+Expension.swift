//
//  DerailedForecastResponseDecorator+Expension.swift
//  WeatherApp
//
//  Created by Vlady Todorchuk on 20.06.2025.
//

import Foundation

extension ForecastDay {
    var currentTemp: String {
        "\(toCelsius(temp.day))°C"
    }
    var tempMax: String {
        "\(toCelsius(temp.max))°C"
    }
    var tempMin: String {
        "\(toCelsius(temp.min))°C"
    }
    var icon: String {
        let defaultVlaue = "01d"
        
        guard let icon = weather.first?.icon else {
            return defaultVlaue
        }
        
        return icon
    }
    
    func toCelsius(_ value: Double) -> Int {
        Int(value - 273.15)
    }
    
    func dateTime() -> Date {
        Date(timeIntervalSince1970: TimeInterval(dt))
    }
}
