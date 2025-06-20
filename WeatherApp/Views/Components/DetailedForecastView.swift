//
//  DetailedForecastView.swift
//  WeatherApp
//
//  Created by Vlady Todorchuk on 19.06.2025.
//

import SwiftUI

struct DetailedForecastView: View {
    @Environment(ForecastViewModel.self) var forecastViewModel
    
    var detailedForecast: DetailedForecastResponse
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Label("16-DAY FORECAST", systemImage: "calendar")
                    .font(.footnote)
                Spacer()
            }
            
            Divider()
            
            if !detailedForecast.list.isEmpty {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(detailedForecast.list, id: \.self) { day in
                            VStack(spacing: 35) {
                                Text(day.dateTime(), format: .dateTime.weekday())
                                WeatherIcons.init(rawValue: day.icon)?.toSymbol()
                                Text(day.currentTemp)
                                
                                Group {
                                    VStack {
                                        Text("Min").fontWeight(.bold)
                                        Text(day.tempMin)
                                    }
                                    .foregroundStyle(.blue.opacity(0.4))
                                    
                                    VStack {
                                        Text("Max").fontWeight(.bold)
                                        Text(day.tempMax)
                                    }
                                    .foregroundStyle(.orange.opacity(0.6))
                                }
                                .font(.footnote)
                            }
                            .padding()
                            .background {
                                RoundedRectangle(cornerRadius: 14, style: .continuous)
                                    .fill(.white)
                            }
                        }
                    }
                }
                .scrollIndicators(.hidden)
            }
        }
    }
}
