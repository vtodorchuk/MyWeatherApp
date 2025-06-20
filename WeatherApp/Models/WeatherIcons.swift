//
//  WeatherIcons.swift
//  WeatherApp
//
//  Created by Vlady Todorchuk on 19.06.2025.
//

import SwiftUI

enum WeatherIcons: String {
    case clearSky = "01d"
    case fewClounds = "02d"
    case scatteredClouds = "03d"
    case brokenClouds = "04d"
    case showerRain = "09d"
    case rain = "10d"
    case thunderstorm = "11d"
    case snowing = "13d"
    case mist = "50d"
    
    @ViewBuilder
    func toSymbol() -> some View {
        switch self {
        case .clearSky:
            Image(systemName: "sun.min.fill")
                .symbolRenderingMode(.monochrome)
                .foregroundStyle(.yellow)
                .shadow(radius: 2)
        case .fewClounds:
            Image(systemName: "cloud.sun.fill")
                .symbolRenderingMode(.palette)
                .foregroundStyle(.white, .yellow)
                .shadow(radius: 2)
        case .scatteredClouds:
            Image(systemName: "cloud.fill")
                .symbolRenderingMode(.monochrome)
                .foregroundStyle(.white)
                .shadow(radius: 2)
        case .brokenClouds:
            Image(systemName: "cloud.fill")
                .symbolRenderingMode(.monochrome)
                .foregroundStyle(.white)
                .shadow(radius: 2)
        case .showerRain:
            Image(systemName: "cloud.drizzle.fill")
                .symbolRenderingMode(.palette)
                .foregroundStyle(.white, .blue)
                .shadow(radius: 2)
        case .rain:
            Image(systemName: "cloud.rain.fill")
                .symbolRenderingMode(.palette)
                .foregroundStyle(.white, .blue)
                .shadow(radius: 2)
        case .thunderstorm:
            Image(systemName: "cloud.bolt.rain.fill")
                .symbolRenderingMode(.palette)
                .foregroundStyle(.white, .blue)
                .shadow(radius: 2)
        case .snowing:
            Image(systemName: "cloud.snow.fill")
                .symbolRenderingMode(.palette)
                .foregroundStyle(.white, .blue)
                .shadow(radius: 2)
        case .mist:
            Image(systemName: "aqi.medium")
                .symbolRenderingMode(.palette)
                .foregroundStyle(.white)
                .shadow(radius: 2)
        }
    }
}
