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
            header()
            search()
            
            ScrollView {
                LazyVStack {
                    if let city = locationViewModel.currentCity {
                        Button {
                            processSearchResult(city: city)
                        } label: {
                            homeSuggestion(city: city).padding()
                        }
                    }
                    
                    ForEach(searchViewModel.searchResults) { city in
                        Button {
                            processSearchResult(city: city)
                        } label: {
                            citiDetails(city: city)
                        }
                    }
                }
            }
            .padding(.vertical)
        }
        .padding()
        .navigationBarBackButtonHidden(true)
        .background(CustomBackground())
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
    func search() -> some View {
        HStack {
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .fill(.white)
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
    func header() -> some View {
        HStack {
            Button {
                mainRouter.popBack(count: 1)
            } label: {
                Image(systemName: "chevron.backward")
                    .foregroundStyle(.black)
            }
            .opacity(mainRouter.isPreviousDestination() ? 1 : 0)
            .disabled(!mainRouter.isPreviousDestination())
            Spacer()
            Text("Search")
                .font(.headline)
                .fontWeight(.semibold)
        }
    }
    
    @ViewBuilder
    func citiDetails(city: City) -> some View {
        VStack(alignment: .leading) {
            HStack(alignment: .firstTextBaseline) {
                Text("\(city.name.capitalized),").font(.title)
                Text(city.state.capitalized).font(.callout)
                Spacer()
                Image(systemName: "chevron.right").foregroundStyle(.black)
            }
            
            Divider()
        }
        .foregroundStyle(.black)
    }
    
    func processSearchResult(city: City) {
        mainRouter.navigate(to: .forecast(city: city))
    }
}

#Preview {
    NavigationStack {
        SearchCityView()
            .environment(LocationViewModel())
            .environment(ForecastViewModel(networkmanager: WeatherNetworkManager()))
            .environmentObject(MainRouter())
    }
}
