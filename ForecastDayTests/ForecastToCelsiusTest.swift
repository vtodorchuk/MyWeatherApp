//
//  ForecastTocelsius.swift
//  ForecastDayTests
//
//  Created by Vlady Todorchuk on 20.06.2025.
//

import Testing
@testable import WeatherApp

struct ForecastToCelsiusTest {
    @Test func toCelsiusToReturnCorrentValueWhenDoubleIsPassedForecastDay() async throws {
        testForecastDay(value: 273.15, expection: 0)
    }
    
    @Test func toCelsiusToReturnCorrentValueWhenPositiveIsPassedForecastDay() async throws {
        testForecastDay(value: 300.15, expection: 27)
    }
    
    @Test func toCelsiusToReturnCorrentValueWhenNegativeIntIsPassedForecastDay() async throws {
        testForecastDay(value: 260, expection: -13)
    }
    
    @Test func toCelsiusToReturnCorrentValueWhenDoubleIsPassedForecastDetails() async throws {
        testForecastDetails(value: 273.15, expection: 0)
    }
    
    @Test func toCelsiusToReturnCorrentValueWhenPositiveIsPassedDetails() async throws {
        testForecastDetails(value: 300.15, expection: 27)
    }
    
    @Test func toCelsiusToReturnCorrentValueWhenNegativeIntIsPassedDetails() async throws {
        testForecastDetails(value: 260, expection: -13)
    }
    
    private func testForecastDay(forecastDay: ForecastDay? = nil, value: Double? = nil, expection: Int) {
        let forecastDay = forecastDay ?? MockData.mockForecastDay()
        let value = value ?? 273.15
        
        #expect(forecastDay.toCelsius(value) == expection)
    }
    
    private func testForecastDetails(forecastDetails: ForecastResponse? = nil, value: Double? = nil, expection: Int) {
        let forecastDetails = forecastDetails ?? MockData.mockForecastResponse()
        let value = value ?? 273.15
        
        #expect(forecastDetails.toCelsius(value) == expection)
    }
}
