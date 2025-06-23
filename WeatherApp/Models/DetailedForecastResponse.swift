//
//  DetailedForecastResponse.swift
//  WeatherApp
//
//  Created by Vlady Todorchuk on 19.06.2025.
//

import Foundation
import SwiftUICore

struct DetailedForecastResponse: Codable, Hashable {
    let city: CityInfo
    let cod: String
    let message: Double
    let cnt: Int
    let list: [ForecastDay]
}

struct CityInfo: Codable, Hashable {
    let id: Int
    let name: String
    let coord: Coordinate
    let country: String
    let population: Int
    let timezone: Int
}

struct Coordinate: Codable, Hashable {
    let lon: Double
    let lat: Double
}

struct ForecastDay: Codable, Hashable {
    let dt: Int
    let sunrise: Int
    let sunset: Int
    let temp: Temperature
    let feelsLike: FeelsLike
    let pressure: Int
    let humidity: Int
    let weather: [Weather]
    let speed: Double
    let deg: Int
    let gust: Double?
    let clouds: Int
    let pop: Double
    let rain: Double?
    
    enum CodingKeys: String, CodingKey, Hashable {
        case dt
        case sunrise
        case sunset
        case temp
        case feelsLike = "feels_like"
        case pressure
        case humidity
        case weather
        case speed
        case deg
        case gust
        case clouds
        case pop
        case rain
    }
}

struct Temperature: Codable, Hashable {
    let day: Double
    let min: Double
    let max: Double
    let night: Double
    let eve: Double
    let morn: Double
}

struct FeelsLike: Codable, Hashable {
    let day: Double
    let night: Double
    let eve: Double
    let morn: Double
}
