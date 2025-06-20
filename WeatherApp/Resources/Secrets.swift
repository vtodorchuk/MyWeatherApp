//
//  Secrets.swift
//  WeatherApp
//
//  Created by Vlady Todorchuk on 19.06.2025.
//

import Foundation

enum Secrets {
    static var weatherApiKey: String {
        Bundle.main.infoDictionary?["WEATHER_API_KEY"] as? String ?? ""
    }
}
