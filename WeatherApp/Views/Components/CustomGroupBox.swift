//
//  CustomGroupBox.swift
//  WeatherApp
//
//  Created by Vlady Todorchuk on 19.06.2025.
//

import SwiftUI

struct CustomGroupBox<Content: View>: View {
    var width: CGFloat?
    var height: CGFloat?
    
    @ViewBuilder let content: Content
    
    var body: some View {
        RoundedRectangle(cornerRadius: 14, style: .continuous)
            .fill(.white)
            .frame(width: width, height: height)
            .overlay {
                content
            }
    }
}

#Preview {
    CustomGroupBox() {
        
    }
}
