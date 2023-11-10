//
//  dayWeatherItemData.swift
//  weatherApp
//
//  Created by 김보연 on 11/8/23.
//

import Foundation

struct DayWeatherItemData {
    
    let todayTimeLabel: String
    let todayWeatherImageView: String
    let todayTemperatureLabel: String
    
    
    init(todayTimeLabel: String, todayWeatherImageView: String, todayTemperatureLabel: String) {
        self.todayTimeLabel = todayTimeLabel
        self.todayWeatherImageView = todayWeatherImageView
        self.todayTemperatureLabel = todayTemperatureLabel
    }
}

var dayWeatherItemData: [DayWeatherItemData] = [
    
    .init(todayTimeLabel: "Now",
          todayWeatherImageView: "sun.max.fill",
          todayTemperatureLabel: "21°"),
    
        .init(todayTimeLabel: "10시",
              todayWeatherImageView: "cloud.sun.fill",
              todayTemperatureLabel: "21°"),
    
        .init(todayTimeLabel: "11시",
              todayWeatherImageView: "cloud.drizzle.fill",
              todayTemperatureLabel: "19°"),
    
        .init(todayTimeLabel: "12시",
              todayWeatherImageView: "cloud.sun.fill",
              todayTemperatureLabel: "19°"),
    
        .init(todayTimeLabel: "13시",
              todayWeatherImageView: "cloud.sun.rain.fill",
              todayTemperatureLabel: "19°"),
    
        .init(todayTimeLabel: "14시",
              todayWeatherImageView: "cloud.drizzle.fill",
              todayTemperatureLabel: "23°"),
    
        .init(todayTimeLabel: "15시",
              todayWeatherImageView: "cloud.drizzle.fill",
              todayTemperatureLabel: "23°"),
    
        .init(todayTimeLabel: "16시",
              todayWeatherImageView: "sun.max.fill",
              todayTemperatureLabel: "17°"),
    
        .init(todayTimeLabel: "17시",
              todayWeatherImageView: "sun.max.fill",
              todayTemperatureLabel: "17°"),
    
        .init(todayTimeLabel: "18시",
              todayWeatherImageView: "cloud.sun.fill",
              todayTemperatureLabel: "17°"),
    
        .init(todayTimeLabel: "19시",
              todayWeatherImageView: "cloud.sun.rain.fill",
              todayTemperatureLabel: "17°")
    
    
]
