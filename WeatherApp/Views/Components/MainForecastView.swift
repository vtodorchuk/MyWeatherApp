//
//  MainForecastView.swift
//  WeatherApp
//
//  Created by Vlady Todorchuk on 19.06.2025.
//

import SwiftUI

struct MainForecastView: View {
    var city: City
    
    var body: some View {
        RoundedRectangle(cornerRadius: 14, style: .continuous)
            .fill(.white)
            .overlay {
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "cloud.sun.fill")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.white, .yellow)
                            .shadow(radius: 2)
                        Text("Main")
                        
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        Text("Feels Like:").fontWeight(.bold)
                        Spacer()
                        Text(city.forecast?.feelsLike ?? "- -")
                    }
                    HStack {
                        Text("Pressure:").fontWeight(.bold)
                        Spacer()
                        Text(city.forecast?.pressure ?? "- -")
                    }
                    HStack {
                        Text("See level:").fontWeight(.bold)
                        Spacer()
                        Text(city.forecast?.seeLevel ?? "- -")
                    }
                }
                .padding()
            }
    }
}
