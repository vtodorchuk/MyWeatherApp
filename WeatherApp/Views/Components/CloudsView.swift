//
//  CloudsView.swift
//  WeatherApp
//
//  Created by Vlady Todorchuk on 19.06.2025.
//

import SwiftUI

struct CloudsView: View {
    var clouds: Clouds
    
    var body: some View {
        RoundedRectangle(cornerRadius: 14, style: .continuous)
            .fill(.white)
            .overlay {
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "cloud.fill")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.white)
                            .shadow(radius: 2)
                        Text("Clouds")
                        Spacer()
                    }
                    
                    HStack {
                        Text("All:").fontWeight(.bold)
                        Text(clouds.all, format: .number)
                    }
                }
                .padding()
            }
    }
}

#Preview {
    CloudsView(clouds: .init(all: 1))
        .frame(width: 200, height: 120)
}
