//
//  MainRouter.swift
//  WeatherApp
//
//  Created by Vlady Todorchuk on 19.06.2025.
//

import Foundation
import SwiftUI

final class MainRouter: ObservableObject {
    @Published var path = NavigationPath()
    
    func navigate(to route: MainDestination) {
        path.append(route)
    }
    
    func navigateToRoot() {
        popBack(count: path.count)
    }
    
    func popBack(count: Int) {
        let screensToRetain = max(0, path.count - count)
        path.removeLast(path.count - screensToRetain)
    }
    
    func isPreviousDestination() -> Bool {
        !path.isEmpty
    }
}
