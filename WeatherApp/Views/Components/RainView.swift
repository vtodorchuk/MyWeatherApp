//
//  Rain.swift
//  WeatherApp
//
//  Created by Vlady Todorchuk on 19.06.2025.
//

import SwiftUI

struct RainView: View {
    var rain: Rain
    
    var body: some View {
        RoundedRectangle(cornerRadius: 14, style: .continuous)
            .fill(.white)
            .overlay {
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "cloud.rain.fill")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.white, .blue)
                            .shadow(radius: 2)
                        Text("Rain")
                        Spacer()
                    }
                    
                    HStack {
                        Text("1h:").fontWeight(.bold)
                        Text(rain.oneHour ?? 0, format: .number)
                    }
                }
                .padding()
            }
    }
}

#Preview {
    RainView(rain: .init(oneHour: 1))
        .frame(width: 200, height: 120)
}
