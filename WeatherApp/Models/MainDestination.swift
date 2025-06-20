//
//  MainDestination.swift
//  WeatherApp
//
//  Created by Vlady Todorchuk on 19.06.2025.
//

import Foundation

enum MainDestination: Hashable {
    case cities
    case forecast(city: City)
    case search
}
