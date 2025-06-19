//
//  SearchCityView.swift
//  WeatherApp
//
//  Created by Vlady Todorchuk on 19.06.2025.
//

import SwiftUI

struct SearchCityView: View {
    @Environment(LocationViewModel.self) var locationViewModel
    @Environment(ForecastViewModel.self) var forecastViewModel
    @EnvironmentObject var mainRouter: MainRouter
    
    @StateObject private var searchViewModel = SearchViewModel()
    @State private var searchField: String = ""
    
    var body: some View {
        VStack {
            header().padding(.horizontal)
            if let city = locationViewModel.currentCity {
                Button {
                    mainRouter.navigate(to: .forecast(city: city))
                } label: {
                    homeSuggestion(city: city).padding()
                }
            }
            
            ScrollView {
                LazyVStack {
                    ForEach(searchViewModel.searchResults) { city in
                        Button {
                            mainRouter.navigate(to: .forecast(city: city))
                        } label: {
                            citiDetails(city: city)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("Search")
    }
    
    @ViewBuilder
    func homeSuggestion(city: City) -> some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "house.fill")
                    Text("Home").font(.headline)
                }
                .fontWeight(.semibold)
                
                HStack {
                    Text("\(city.name.capitalized),")
                    Text(city.state.capitalized)
                }
                
                Divider()
            }
            
            Image(systemName: "chevron.right").foregroundStyle(.black)
        }
        .foregroundStyle(.black)
    }
    
    @ViewBuilder
    func header() -> some View {
        HStack {
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .fill(.thinMaterial)
                .frame(height: 30)
                .overlay {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("Search City", text: $searchField)
                            .autocorrectionDisabled()
                            .textInputAutocapitalization(.never)
                            .onChange(of: searchField) {
                                searchViewModel.searchPlaces(searchField)
                            }
                            .foregroundStyle(.black)
                    }
                    .padding()
                }
            
            if searchField != "" {
                Button {
                    withAnimation {
                        searchField = ""
                    }
                } label: {
                    Text("Cancel")
                }
            }
        }
    }
    
    @ViewBuilder
    func citiDetails(city: City) -> some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "globe.europe.africa")
                    .fontWeight(.semibold)
                Text("\(city.name.capitalized),")
                Text(city.state.capitalized)
                Spacer()
                Image(systemName: "chevron.right").foregroundStyle(.black)
            }
            
            Divider()
        }
        .foregroundStyle(.black)
    }
}

#Preview {
    NavigationStack {
        SearchCityView()
            .environment(LocationViewModel())
            .environment(ForecastViewModel())
            .environmentObject(MainRouter())
    }
}
