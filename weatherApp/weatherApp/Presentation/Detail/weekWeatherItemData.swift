//
//  weekWeatherItemData.swift
//  weatherApp
//
//  Created by 김보연 on 11/1/23.
//

import Foundation

struct WeekWeatherItemData {
    let dayOfTheWeekLabel: String
    let weatherIconImageView: String
    let rainingPercentLabel: String
    let dayOfMinimumTemperatureLabel: String
    let graphImageView: String
    let dayOfMaximumTemperatureLabel: String
    
    init(dayOfTheWeekLabel: String, weatherIconImageView: String, rainingPercentLabel: String, dayOfMinimumTemperatureLabel: String, graphImageView: String, dayOfMaximumTemperatureLabel: String) {
        self.dayOfTheWeekLabel = dayOfTheWeekLabel
        self.weatherIconImageView = weatherIconImageView
        self.rainingPercentLabel = rainingPercentLabel
        self.dayOfMinimumTemperatureLabel = dayOfMinimumTemperatureLabel
        self.graphImageView = graphImageView
        self.dayOfMaximumTemperatureLabel = dayOfMaximumTemperatureLabel
    }
}

var weekWeatherItemData: [WeekWeatherItemData] = [
    
    .init(dayOfTheWeekLabel: "오늘",
          weatherIconImageView: "sun.max.fill",
          rainingPercentLabel: "",
          dayOfMinimumTemperatureLabel: "15°",
          graphImageView: "graph01",
          dayOfMaximumTemperatureLabel: "29°"),
    
        .init(dayOfTheWeekLabel: "월",
              weatherIconImageView: "cloud.drizzle.fill",
              rainingPercentLabel: "60%",
              dayOfMinimumTemperatureLabel: "18°",
              graphImageView: "graph02",
              dayOfMaximumTemperatureLabel: "27°"),
    
        .init(dayOfTheWeekLabel: "화",
              weatherIconImageView: "cloud.drizzle.fill",
              rainingPercentLabel: "60%",
              dayOfMinimumTemperatureLabel: "20°",
              graphImageView: "graph03",
              dayOfMaximumTemperatureLabel: "25°"),
    
        .init(dayOfTheWeekLabel: "수",
              weatherIconImageView: "cloud.drizzle.fill",
              rainingPercentLabel: "70%",
              dayOfMinimumTemperatureLabel: "17°",
              graphImageView: "graph04",
              dayOfMaximumTemperatureLabel: "25°"),
    
        .init(dayOfTheWeekLabel: "목",
              weatherIconImageView: "cloud.drizzle.fill",
              rainingPercentLabel: "50%",
              dayOfMinimumTemperatureLabel: "17°",
              graphImageView: "graph05",
              dayOfMaximumTemperatureLabel: "25°"),
    
        .init(dayOfTheWeekLabel: "금",
              weatherIconImageView: "cloud.sun.fill",
              rainingPercentLabel: "",
              dayOfMinimumTemperatureLabel: "20°",
              graphImageView: "graph06",
              dayOfMaximumTemperatureLabel: "26°"),
    
        .init(dayOfTheWeekLabel: "토",
              weatherIconImageView: "sun.max.fill",
              rainingPercentLabel: "",
              dayOfMinimumTemperatureLabel: "18°",
              graphImageView: "graph07",
              dayOfMaximumTemperatureLabel: "25°"),
    
        .init(dayOfTheWeekLabel: "일",
              weatherIconImageView: "cloud.drizzle.fill",
              rainingPercentLabel: "50%",
              dayOfMinimumTemperatureLabel: "13°",
              graphImageView: "graph08",
              dayOfMaximumTemperatureLabel: "21°"),
    
        .init(dayOfTheWeekLabel: "월",
              weatherIconImageView: "cloud.drizzle.fill",
              rainingPercentLabel: "50%",
              dayOfMinimumTemperatureLabel: "12°",
              graphImageView: "graph09",
              dayOfMaximumTemperatureLabel: "19°"),
    
        .init(dayOfTheWeekLabel: "화",
              weatherIconImageView: "sun.max.fill",
              rainingPercentLabel: "",
              dayOfMinimumTemperatureLabel: "15°",
              graphImageView: "graph10",
              dayOfMaximumTemperatureLabel: "25°"),
    
        .init(dayOfTheWeekLabel: "수",
              weatherIconImageView: "sun.max.fill",
              rainingPercentLabel: "",
              dayOfMinimumTemperatureLabel: "15°",
              graphImageView: "graph11",
              dayOfMaximumTemperatureLabel: "25°")

]
