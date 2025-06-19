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
            SearchCityView()
        }
    }
}

#Preview {
    MainView()
        .environmentObject(MainRouter())
}
