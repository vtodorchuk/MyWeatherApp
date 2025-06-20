//
//  ForecastResponseDecorator+Extension.swift
//  WeatherApp
//
//  Created by Vlady Todorchuk on 20.06.2025.
//

import Foundation

extension ForecastResponse {
    var currentTemp: String {
        "\(toCelsius(main.temp))°C"
    }
    var weatherDescription: String {
        weather.first?.description.capitalized ?? ""
    }
    var tempMax: String {
        "H: \(toCelsius(main.tempMax))°C"
    }
    var tempMin: String {
        "L: \(toCelsius(main.tempMin))°C"
    }
    var feelsLike: String {
        "\(toCelsius(main.feelsLike))°C"
    }
    var pressure: String {
        "\(main.pressure) hPa"
    }
    var seeLevel: String {
        "\(main.seaLevel ?? 0) hPa"
    }
    
    func toCelsius(_ value: Double) -> Int {
        Int(value - 273.15)
    }
    
    func dateTime() -> Date {
        Date(timeIntervalSince1970: TimeInterval(dt))
    }
}
