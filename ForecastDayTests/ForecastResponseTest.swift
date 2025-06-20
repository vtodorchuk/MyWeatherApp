//
//  ForecastResponseTest.swift
//  ForecastDayTests
//
//  Created by Vlady Todorchuk on 20.06.2025.
//

import Testing
@testable import WeatherApp

struct ForecastResponseTest {
    @Test func forecastCurrentTempToBeInGoodFormat() async throws {
        let forecast = MockData.mockForecastResponse(
            main: MockData.mockMain(temp: 273.15)
        )
        
        #expect(forecast.currentTemp == "0°C")
    }
    
    @Test func forecastCurrentTempToBeInGoodFormatNegative() async throws {
        let forecast = MockData.mockForecastResponse(
            main: MockData.mockMain(temp: 260.15)
        )
        
        #expect(forecast.currentTemp == "-13°C")
    }
    
    @Test func forecastCurrentTempToBeInGoodFormatMoreThatZero() async throws {
        let forecast = MockData.mockForecastResponse(
            main: MockData.mockMain(temp: 300.15)
        )
        
        #expect(forecast.currentTemp == "27°C")
    }
    
    @Test func forecastMinTempToBeInGoodFormat() async throws {
        let forecast = MockData.mockForecastResponse()
        
        #expect(forecast.tempMin == "L: 0°C")
    }
    
    @Test func forecastMaxTempToBeInGoodFormat() async throws {
        let forecast = MockData.mockForecastResponse()
        
        #expect(forecast.tempMax == "H: 27°C")
    }
    
    @Test func forecastFeelsLikeToBeInGoodFormat() async throws {
        let forecast = MockData.mockForecastResponse(
            main: MockData.mockMain(feelsLike: 300.15)
        )
        
        #expect(forecast.feelsLike == "27°C")
    }
    
    @Test func forecastFeelsLikeToBeInGoodFormatNegative() async throws {
        let forecast = MockData.mockForecastResponse(
            main: MockData.mockMain(feelsLike: 260.15)
        )
        
        #expect(forecast.feelsLike == "-13°C")
    }
    
    @Test func forecastFeelsLikeToBeInGoodFormatZero() async throws {
        let forecast = MockData.mockForecastResponse(
            main: MockData.mockMain(feelsLike: 273.15)
        )
        
        #expect(forecast.feelsLike == "0°C")
    }
    
    @Test func forecastPressureToBeInGoodFormat() async throws {
        let forecast = MockData.mockForecastResponse(
            main: MockData.mockMain(pressure: 1000)
        )
        
        #expect(forecast.pressure == "1000 hPa")
    }
    
    @Test func forecastSeeLevelToBeInGoodFormat() async throws {
        let forecast = MockData.mockForecastResponse(
            main: MockData.mockMain(seaLevel: 1000)
        )
        
        #expect(forecast.seeLevel == "1000 hPa")
    }
}
