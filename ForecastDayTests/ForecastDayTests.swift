//
//  ForecastDayTests.swift
//  ForecastDayTests
//
//  Created by Vlady Todorchuk on 20.06.2025.
//

import Testing
import Foundation
@testable import WeatherApp

struct ForecastDayTests {
    @Test func forecastCurrentTempToBeInGoodFormat() async throws {
        let forecastDay = MockData.mockForecastDay()
        
        #expect(forecastDay.currentTemp == "26°C")
    }
    
    @Test func forecastCurrentTempToBeNegative() async throws {
        let forecastDay = MockData.mockForecastDay(
            temp: MockData.mockTemperature(day: 260.15)
        )
        
        #expect(forecastDay.currentTemp == "-13°C")
    }
    
    @Test func forecastMinTempToBeInGoodFormat() async throws {
        let forecastDay = MockData.mockForecastDay()
        
        #expect(forecastDay.tempMin == "15°C")
    }
    
    @Test func forecastMaxTempToBeInGoodFormat() async throws {
        let forecastDay = MockData.mockForecastDay()
        
        #expect(forecastDay.tempMax == "26°C")
    }
    
    @Test func forecastIconToReturnCorrentIconId() async throws {
        let forecastDay = MockData.mockForecastDay(
            weather: [MockData.mockWeather()]
        )
        
        #expect(forecastDay.icon == "10d")
    }
    
    @Test func forecastIconToReturnDefaultIconId() async throws {
        let forecastDay = MockData.mockForecastDay()
        
        #expect(forecastDay.icon == "01d")
    }
}
