//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Vlady Todorchuk on 19.06.2025.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    @State private var locationViewModel = LocationViewModel()
    @State private var forecastViewModel = ForecastViewModel(networkmanager: WeatherNetworkManager())
    @StateObject private var router = MainRouter()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .onAppear {
                    locationViewModel.checkIfLocationServicesIsEnabled()
                }
                .alert(locationViewModel.locationAuthorizationStatus?.title()  ?? "", isPresented: $locationViewModel.isAlertShown) {
                    Button("Ok", role: .cancel) {}
                    Button {
                        if let settingsUrl = URL(string: UIApplication.openSettingsURLString) {
                            UIApplication.shared.open(settingsUrl)
                        }
                        locationViewModel.locationAuthorizationStatus = nil
                        locationViewModel.isAlertShown = false
                    } label: {
                        Text("Open Settings")
                    }
                } message: {
                    Text(locationViewModel.locationAuthorizationStatus?.message() ?? "")
                }
        }
        .environment(locationViewModel)
        .environment(forecastViewModel)
        .environmentObject(router)
    }
}
