//
//  Wind.swift
//  WeatherApp
//
//  Created by Vlady Todorchuk on 19.06.2025.
//

import SwiftUI

struct WindView: View {
    var wind: Wind
    
    var body: some View {
        RoundedRectangle(cornerRadius: 14, style: .continuous)
            .fill(.white)
            .overlay {
                VStack(alignment: .leading) {
                    HStack {
                        Label("Wind", systemImage: "wind")
                        Spacer()
                    }
                    
                    HStack {
                        Text("Speed:").fontWeight(.bold)
                        Text(wind.speed, format: .number)
                    }
                    
                    HStack {
                        Text("Deg:").fontWeight(.bold)
                        Text(wind.deg, format: .number)
                    }
                    
                    HStack {
                        Text("Gust:").fontWeight(.bold)
                        Text(wind.gust ?? 0, format: .number)
                    }
                }
                .padding()
            }
    }
}

#Preview {
    WindView(wind: .init(speed: 10, deg: 1, gust: 21))
        .frame(width: 200, height: 120)
}
