//
//  CustomBackground.swift
//  WeatherApp
//
//  Created by Vlady Todorchuk on 19.06.2025.
//

import SwiftUI

struct CustomBackground: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.blue.opacity(0.3), .white]), startPoint: .bottom, endPoint: .top)
                    .ignoresSafeArea()
    }
}

#Preview {
    CustomBackground()
}
