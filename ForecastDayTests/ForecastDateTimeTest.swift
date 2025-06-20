//
//  ForecastDateTimeTest.swift
//  ForecastDayTests
//
//  Created by Vlady Todorchuk on 20.06.2025.
//

import Testing
import Foundation
@testable import WeatherApp

struct ForecastDateTimeTest {
    @Test func dateTimeIsDisplayDateCorrectInForecastDay() async throws {
        let dt = 1_717_200_000
        let dateString = "2024-06-01 00:00:00 +0000"
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        let forecastDay = MockData.mockForecastDay(
            dt: dt
        )
        
        #expect(forecastDay.dateTime() == formatter.date(from: dateString))
    }
    
    @Test func dateTimeIsDisplayDateCorrectForecastDetails() async throws {
        let dt = 1_717_200_000
        let dateString = "2024-06-01 00:00:00 +0000"
        let formatter = DateFormatter()
        let forecast = MockData.mockForecastResponse(dt: dt)
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        #expect(forecast.dateTime() == formatter.date(from: dateString))
    }
}
