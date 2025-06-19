//
//  ContentView.swift
//  WeatherApp
//
//  Created by Vlady Todorchuk on 19.06.2025.
//

import SwiftUI

struct ContentView: View {
    @Environment(LocationViewModel.self) var locationViewModel
    @Environment(ForecastViewModel.self) var forecastViewModel
    @EnvironmentObject var mainRouter: MainRouter
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environment(LocationViewModel())
        .environment(ForecastViewModel())
        .environmentObject(MainRouter())
}
