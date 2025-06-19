//
//  ForecastView.swift
//  WeatherApp
//
//  Created by Vlady Todorchuk on 19.06.2025.
//

import SwiftUI

struct ForecastView: View {
    @Environment(LocationViewModel.self) var locationViewModel
    @Environment(ForecastViewModel.self) var forecastViewModel
    @EnvironmentObject var mainRouter: MainRouter
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ForecastView()
        .environment(LocationViewModel())
        .environment(ForecastViewModel())
        .environmentObject(MainRouter())
}
