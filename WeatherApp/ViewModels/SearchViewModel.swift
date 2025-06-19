//
//  SearchViewModel.swift
//  WeatherApp
//
//  Created by Vlady Todorchuk on 19.06.2025.
//

import Foundation
import MapKit

class SearchViewModel: NSObject, ObservableObject, MKLocalSearchCompleterDelegate {
    @Published var searchResults: [City] = []
    
    private let searchCompleter = MKLocalSearchCompleter()
    private var searchText: String?
    
    override init() {
        super.init()
        searchCompleter.delegate = self
        searchCompleter.resultTypes = .pointOfInterest
    }
    
    func searchPlaces(_ searchText: String) {
        guard !searchText.isEmpty else {
            searchResults = []
            return
        }
        
        self.searchText = searchText
        searchCompleter.queryFragment = searchText
    }
    
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        Task {
            var cities: [City] = []
            
            for completion in completer.results.prefix(5) {
                let searchRequest = MKLocalSearch.Request(completion: completion)
                let search = MKLocalSearch(request: searchRequest)
                
                do {
                    let response = try await search.start()
                    if let item = response.mapItems.first {
                        let coordinate = item.placemark.coordinate
                        let cityName = item.placemark.locality ?? "Unknown City"
                        let state = item.placemark.country ?? "Unknown State"
                        
                        let city = City(name: cityName, state: state, lon: coordinate.longitude, lat: coordinate.latitude)
                        cities.append(city)
                    }
                } catch {
                    print("Search error: \(error.localizedDescription)")
                }
            }
            
            self.searchResults = cities
        }
    }
}

