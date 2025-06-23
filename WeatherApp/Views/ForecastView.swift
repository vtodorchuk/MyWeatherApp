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
    
    @State private var city: City

    init(city: City) {
        _city = State(initialValue: city)
    }
    
    var body: some View {
        ZStack {
            CustomBackground()
            
            VStack {
                header()
                
                VStack(alignment: .center, spacing: 15) {
                    if locationViewModel.currentCity?.id == city.id {
                        HStack {
                            Image(systemName: "location")
                            Text("Current Location")
                                .foregroundStyle(.black)
                                .font(.caption)
                        }
                    } else {
                        HStack {
                            Image(systemName: "location")
                            Text("City")
                                .foregroundStyle(.black)
                                .font(.caption)
                        }
                    }
                    
                    Group {
                        Text(city.name.capitalized)
                            .font(.headline)
                        Text(city.forecast?.currentTemp ?? "")
                            .font(.largeTitle)
                    }
                    .fontDesign(.rounded)
                    
                    Text(city.forecast?.weatherDescription ?? "- -")
                    
                    HStack(alignment: .bottom, spacing: 20) {
                        Text(city.forecast?.tempMax ?? "- -")
                        Text(city.forecast?.tempMin ?? "- -")
                    }
                }
                .padding(.top, 25)
                .padding(.bottom, 25)
                ScrollView {
                    VStack(alignment: .center, spacing: 30) {
                        VStack {
                            HStack {
                                Label("General", systemImage: "list.bullet.clipboard")
                                    .font(.footnote)
                                Spacer()
                            }
                            
                            Divider()
                            
                            ScrollView(.horizontal) {
                                HStack {
                                    MainForecastView(city: city)
                                        .frame(width: 200, height: 120)
                                    
                                    if let rain = city.forecast?.rain {
                                        RainView(rain: rain)
                                            .frame(width: 200, height: 120)
                                    }
                                    
                                    if let clouds = city.forecast?.clouds {
                                        CloudsView(clouds: clouds)
                                            .frame(width: 200, height: 120)
                                    }
                                    
                                    if let wind = city.forecast?.wind {
                                        WindView(wind: wind)
                                            .frame(width: 200, height: 120)
                                    }
                                }
                            }
                            .scrollIndicators(.hidden)
                        }
                        
                        if let detailedForecast = city.detailedForecast {
                            DetailedForecastView(detailedForecast: detailedForecast)
                                .padding(.vertical)
                        } else {
                            ScrollView {}
                        }
                    }
                }
                .scrollIndicators(.never)
            }
            .padding()
            .navigationBarBackButtonHidden(true)
            .onAppear {
                Task {
                    await fetchDetaildForecast()
                    await fecthCityForecast()
                }
            }
        }
    }
    
    func fetchDetaildForecast() async {
        await forecastViewModel.getDetailedForecast(lat: city.lat, lon: city.lon) { detaildForecast in
            if let detaildForecast = detaildForecast {
                city.detailedForecast = detaildForecast
            }
        }
    }
    
    func fecthCityForecast() async {
        await forecastViewModel.getCityForecast(lat: city.lat, lon: city.lon) { forecast in
            if let forecast = forecast {
                city.forecast = forecast
            }
        }
    }
    
    @ViewBuilder
    func header() -> some View {
        HStack {
            Button {
                mainRouter.navigateToRoot()
            } label: {
                Image(systemName: "chevron.backward")
                    .foregroundStyle(.black)
            }
            .opacity(mainRouter.isPreviousDestination() ? 1 : 0)
            .disabled(!mainRouter.isPreviousDestination())
            Spacer()
            Text(city.forecast?.dateTime() ?? .now, format: .dateTime.hour().minute())
            Spacer()
            Button {
                city.pinned.toggle()
                locationViewModel.pinnedCity(city: city)
            } label: {
                Image(systemName: city.pinned ? "pin.slash" : "pin")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.black)
            }
        }
    }
}

#Preview {
    ForecastView(city: .init(name: "Lviv", lon: 1, lat: 1))
        .environment(LocationViewModel())
        .environment(ForecastViewModel(networkmanager: WeatherNetworkManager()))
        .environmentObject(MainRouter())
}
