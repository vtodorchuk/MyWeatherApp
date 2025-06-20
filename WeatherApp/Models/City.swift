//
//  City.swift
//  WeatherApp
//
//  Created by Vlady Todorchuk on 19.06.2025.
//

import Foundation
import CoreLocation

struct City: Hashable, Equatable, Identifiable {
    var id = UUID()
    var name: String
    var state: String = ""
    var pinned: Bool = false
    var lon: CLLocationDegrees
    var lat: CLLocationDegrees
    
    var forecast: ForecastResponse?
    var detailedForecast: DetailedForecastResponse?
}
