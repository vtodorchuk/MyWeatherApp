//
//  ContentView.swift
//  WeatherApp
//
//  Created by Vlady Todorchuk on 19.06.2025.
//

import SwiftUI

struct CitiesView: View {
    @Environment(LocationViewModel.self) var locationViewModel
    @Environment(ForecastViewModel.self) var forecastViewModel
    @EnvironmentObject var mainRouter: MainRouter
    
    var body: some View {
        VStack {
            header()
            
            ScrollView {
                ForEach(locationViewModel.pinnedCities) { city in
                    cityDetails(city: city)
                        .onTapGesture {
                            mainRouter.navigate(to: .forecast(city: city))
                        }
                        .task {
                            if let index = locationViewModel.pinnedCities.firstIndex(of: city) {
                                await forecastViewModel.getCityForecast(lat: city.lat, lon: city.lon)
                                locationViewModel.pinnedCities[index].forecast = forecastViewModel.forecast
                            }
                        }
                }
            }
            .listStyle(.plain)
        }
        .padding()
        .navigationBarBackButtonHidden(true)
        .background(CustomBackground())
    }
    
    @ViewBuilder
    func header() -> some View {
        HStack {
            Button {
                mainRouter.navigate(to: .search)
            } label: {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.black)
            }
            
            Spacer()
            Text("Cities")
                .font(.headline)
                .fontWeight(.semibold)
        }
    }
    
    @ViewBuilder
    func cityDetails(city: City) -> some View {
        RoundedRectangle(cornerRadius: 14, style: .continuous)
            .fill(.white)
            .frame(height: 80)
            .overlay {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text(city.name).font(.title3)
                        Spacer()
                        if locationViewModel.currentCity == city {
                            Text("My Location").font(.footnote)
                        } else {
                            Text(city.forecast?.dateTime() ?? .now, format: .dateTime.hour().minute()).font(.footnote)
                        }
                        Text(city.forecast?.weatherDescription ?? "").font(.footnote)
                    }
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text(city.forecast?.currentTemp ?? "").font(.title3)
                        Spacer()
                        Spacer()
                        Text("H: \(city.forecast?.tempMin ?? "")   L: \(city.forecast?.tempMax ?? "")").font(.footnote)
                    }
                }
                .padding()
            }
    }
}

#Preview {
    CitiesView()
        .environment(LocationViewModel())
        .environment(ForecastViewModel(networkmanager: WeatherNetworkManager()))
        .environmentObject(MainRouter())
}
