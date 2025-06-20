//
//  ForecastDayTests.swift
//  ForecastDayTests
//
//  Created by Vlady Todorchuk on 20.06.2025.
//

import Testing
@testable import WeatherApp
import Foundation

struct ForecastDayTests {
    let forecastDay = ForecastDay(
        dt: 1661857200,
        sunrise: 1661834187,
        sunset: 1661882248,
        temp: Temperature(day: 299.66, min: 288.93, max: 299.66, night: 290.31, eve: 297.16, morn: 288.93),
        feelsLike: FeelsLike(day: 299.66, night: 290.3, eve: 297.1, morn: 288.73),
        pressure: 1017,
        humidity: 44,
        weather: [Weather(id: 500, main: "Rain", description: "light rain", icon: "10d")],
        speed: 2.7,
        deg: 209,
        gust: 3.58,
        clouds: 53,
        pop: 0.7,
        rain: 2.51
    )
    
    @Test func forecastCurrentTempToBeInGoodFormat() async throws {
        #expect(forecastDay.currentTemp == "26°C")
    }
    
    @Test func forecastMinTempToBeInGoodFormat() async throws {
        #expect(forecastDay.tempMin == "15°C")
    }
    
    @Test func forecastMaxTempToBeInGoodFormat() async throws {
        #expect(forecastDay.tempMax == "26°C")
    }
    
    @Test func forecastIconToReturnCorrentIconId() async throws {
        #expect(forecastDay.icon == "10d")
    }
    
    @Test func forecastIconToReturnDefaultIconId() async throws {
        let forecastDay = mockForecastDay(
            mockTemp: mockTemperature(),
            mockFeelsLike: mockFeelsLike(),
            weather: []
        )
        
        #expect(forecastDay.icon == "01d")
    }
    
    @Test func toCelsiusToReturnCorrentValueWhenDoubleIsPassed() async throws {
        let value = 273.15
        #expect(forecastDay.toCelsius(value) == 0)
    }
    
    @Test func toCelsiusToReturnCorrentValueWhenPositiveIsPassed() async throws {
        let value: Double = 300.15
        #expect(forecastDay.toCelsius(value) == 27)
    }
    
    @Test func toCelsiusToReturnCorrentValueWhenNegativeIntIsPassed() async throws {
        let value: Double = 260
        #expect(forecastDay.toCelsius(value) == -13)
    }
    
    @Test func dateTimeIsDisplayDateCorrect() async throws {
        let db = 1_717_200_000
        let dateString = "2024-06-01 00:00:00 +0000"
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        let forecastDay = mockForecastDay(
            dt: db,
            mockTemp: mockTemperature(),
            mockFeelsLike: mockFeelsLike(),
            weather: []
        )
        
        print(Date(timeIntervalSince1970: TimeInterval(db)))
        #expect(forecastDay.dateTime() == formatter.date(from: dateString))
    }
    
    // MARK: Custom mocks for testing
    
    func mockForecastDay(
        dt: Int? = nil, sunrise: Int? = nil, sunset: Int? = nil,
        mockTemp: Temperature, mockFeelsLike: FeelsLike,
        pressure: Int? = nil, humidity: Int? = nil, weather: [Weather],
        speed: Double? = nil, deg: Int? = nil, gust: Double? = nil, clouds: Int? = nil, pop: Double? = nil, rain: Double? = nil
    ) -> ForecastDay {
        ForecastDay(
            dt: dt ?? 1661857200,
            sunrise: sunrise ?? 1661834187,
            sunset: sunset ?? 1661882248,
            temp: mockTemp,
            feelsLike: mockFeelsLike,
            pressure: pressure ?? 1017,
            humidity: humidity ?? 44,
            weather: weather,
            speed: speed ?? 2.7,
            deg: deg ?? 209,
            gust: gust ?? 3.58,
            clouds: clouds ?? 53,
            pop: pop ?? 0.7,
            rain: rain ?? 2.51
        )
    }
    
    func mockTemperature(day: Double? = nil, min: Double? = nil, max: Double? = nil, night: Double? = nil, eve: Double? = nil, morn: Double? = nil) -> Temperature {
        Temperature(
            day: day ?? 299.66,
            min: min ?? 288.93,
            max: max ?? 299.66,
            night: night ?? 290.31,
            eve: eve ?? 297.16,
            morn: morn ?? 288.93
        )
    }
    
    func mockFeelsLike(day: Double? = nil, night: Double? = nil, eve: Double? = nil, morn: Double? = nil) -> FeelsLike {
        FeelsLike(
            day: day ?? 299.66,
            night: night ?? 290.3,
            eve: eve ?? 297.1,
            morn: morn ?? 288.73
        )
    }
    
    func mockWeather(id: Int? = nil, main: String? = nil, description: String? = nil, icon: String? = nil) -> Weather {
        Weather(
            id: id ?? 800,
            main: main ?? "Clear",
            description: description ?? "clear sky",
            icon: icon ?? "01d"
        )
    }
}
