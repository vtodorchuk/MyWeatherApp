//
//  WeatherResponse.swift
//  WeatherApp
//
//  Created by Vlady Todorchuk on 19.06.2025.
//

import Foundation

struct ForecastResponse: Codable, Hashable {
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let rain: Rain?
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone: Int
    let id: Int
    let name: String
    let cod: Int
}

struct Weather: Codable, Hashable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Main: Codable, Hashable {
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let pressure: Int
    let humidity: Int
    let seaLevel: Int?
    let grndLevel: Int?

    enum CodingKeys: String, CodingKey, Hashable {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case humidity
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
    }
}

struct Wind: Codable, Hashable {
    let speed: Double
    let deg: Int
    let gust: Double?
}

struct Rain: Codable, Hashable {
    let oneHour: Double?

    enum CodingKeys: String, CodingKey, Hashable {
        case oneHour = "1h"
    }
}

struct Clouds: Codable, Hashable {
    let all: Int
}

struct Sys: Codable, Hashable {
    let type: Int
    let id: Int
    let country: String
    let sunrise: Int
    let sunset: Int
}
