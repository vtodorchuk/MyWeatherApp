//
//  MainView.swift
//  WeatherApp
//
//  Created by Vlady Todorchuk on 19.06.2025.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var mainRouter: MainRouter
    
    var body: some View {
        NavigationStack(path: $mainRouter.path) {
            VStack {
                CitiesView()
            }
            .navigationDestination(for: MainDestination.self) { destination in
                switch destination {
                case .cities: CitiesView()
                case .forecast(let city): ForecastView(city: city)
                case .search: SearchCityView()
                }
            }
        }
    }
}

#Preview {
    MainView()
        .environment(LocationViewModel())
        .environment(ForecastViewModel(networkmanager: WeatherNetworkManager()))
        .environmentObject(MainRouter())
}
