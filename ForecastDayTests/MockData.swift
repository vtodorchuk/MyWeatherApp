//
//  MockData.swift
//  ForecastDayTests
//
//  Created by Vlady Todorchuk on 20.06.2025.
//

import Foundation
@testable import WeatherApp

struct MockData {
    static func mockForecastDay(
        dt: Int? = nil, sunrise: Int? = nil, sunset: Int? = nil,
        temp: Temperature? = nil, feelsLike: FeelsLike? = nil,
        pressure: Int? = nil, humidity: Int? = nil, weather: [Weather] = [],
        speed: Double? = nil, deg: Int? = nil, gust: Double? = nil, clouds: Int? = nil, pop: Double? = nil, rain: Double? = nil
    ) -> ForecastDay {
        ForecastDay(
            dt: dt ?? 1661857200,
            sunrise: sunrise ?? 1661834187,
            sunset: sunset ?? 1661882248,
            temp: temp ?? mockTemp(),
            feelsLike: feelsLike ?? mockFeelsLike(),
            pressure: pressure ?? 1017,
            humidity: humidity ?? 44,
            weather: weather ?? [mockWeather()],
            speed: speed ?? 2.7,
            deg: deg ?? 209,
            gust: gust ?? 3.58,
            clouds: clouds ?? 53,
            pop: pop ?? 0.7,
            rain: rain ?? 2.51
        )
    }
    
    static func mockTemp(day: Double? = nil, min: Double? = nil, max: Double? = nil, night: Double? = nil, eve: Double? = nil, morn: Double? = nil) -> Temperature {
        Temperature(
            day: day ?? 299.66,
            min: min ?? 288.93,
            max: max ?? 299.66,
            night: night ?? 290.31,
            eve: eve ?? 297.16,
            morn: morn ?? 288.93
        )
    }
    
    static func mockFeelsLike(day: Double? = nil, night: Double? = nil, eve: Double? = nil, morn: Double? = nil) -> FeelsLike {
        FeelsLike(
            day: day ?? 299.66,
            night: day ?? 290.3,
            eve: day ?? 297.1,
            morn: day ?? 288.73
        )
    }
    
    static func mockTemperature(day: Double? = nil, min: Double? = nil, max: Double? = nil, night: Double? = nil, eve: Double? = nil, morn: Double? = nil) -> Temperature {
        Temperature(
            day: day ?? 299.66,
            min: min ?? 288.93,
            max: max ?? 299.66,
            night: night ?? 290.31,
            eve: eve ?? 297.16,
            morn: morn ?? 288.93
        )
    }
    
    static func mockWeather(id: Int? = nil, main: String? = nil, description: String? = nil, icon: String? = nil) -> Weather {
        Weather(
            id: id ?? 800,
            main: main ?? "Clear",
            description: description ?? "clear sky",
            icon: icon ?? "10d"
        )
    }
    
    static func mockForecastResponse(weather: [Weather] = [], base: String? = nil, main: Main? = nil, visibility: Int? = nil, wind: Wind? = nil, rain: Rain? = nil, clouds: Clouds? = nil, dt: Int? = nil, sys: Sys? = nil, timezone: Int? = nil, id: Int? = nil, name: String? = nil, cod: Int? = nil) -> ForecastResponse {
        ForecastResponse(
            weather: weather,
            base: base ?? "stations",
            main: main ?? mockMain(),
            visibility: visibility ?? 10_000,
            wind: wind ?? mockWind(),
            rain: rain ?? mockRain(),
            clouds: clouds ?? mockClouds(),
            dt: dt ?? 1661857200,
            sys: sys ?? mockSys(),
            timezone: timezone ?? 7200,
            id: id ?? 3165523,
            name: name ?? "Province of Turin",
            cod: cod ?? 200
        )
    }
    
    static func mockMain(temp: Double? = nil, feelsLike: Double? = nil, tempMin: Double? = nil, tempMax: Double? = nil, pressure: Int? = nil, humidity: Int? = nil, seaLevel: Int? = nil, grndLevel: Int? = nil) -> Main {
        Main(
            temp: temp ?? 273.15,
            feelsLike: feelsLike ?? 273.15,
            tempMin: tempMin ?? 273.15,
            tempMax: tempMax ?? 300.15,
            pressure: pressure ?? 1013,
            humidity: humidity ?? 60,
            seaLevel: seaLevel ?? 1000,
            grndLevel: grndLevel ?? 100
        )
    }
    
    static func mockWind(speed: Double? = nil, deg: Int? = nil, gust: Double? = nil) -> Wind {
        Wind(
            speed: speed ?? 4.6,
            deg: deg ?? 80,
            gust: gust ?? 1.1
        )
    }
    
    static func mockRain(oneH: Double? = nil) -> Rain {
        Rain(oneHour: oneH ?? 1)
    }
    
    static func mockClouds(all: Int? = nil) -> Clouds {
        Clouds(all: all ?? 1)
    }
    
    static func mockSys(country: String? = nil, sunrise: Int? = nil, sunset: Int? = nil) -> Sys {
        Sys(
            type: 1, id: 1,
            country: country ?? "US",
            sunrise: sunrise ?? 1609459200,
            sunset: sunset ?? 1609495600
        )
    }
}
