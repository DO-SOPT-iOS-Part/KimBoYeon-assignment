//
//  weatherCardItemData.swift
//  weatherApp
//
//  Created by 김보연 on 11/2/23.
//

import Foundation

struct WeatherCardItemData {
    
    let myLocationLabel: String
    let myLocationNameLabel: String
    let myLocationConditionLabel: String
    let myLocationAverageTemperatureLabel: String
    let myLocationMinimumTemperatureLabel: String
    let myLocationMaximumTemperatureLabel: String
    
    init(myLocationLabel: String, myLocationNameLabel: String, myLocationConditionLabel: String, myLocationAverageTemperatureLabel: String, myLocationMinimumTemperatureLabel: String, myLocationMaximumTemperatureLabel: String) {
        self.myLocationLabel = myLocationLabel
        self.myLocationNameLabel = myLocationNameLabel
        self.myLocationConditionLabel = myLocationConditionLabel
        self.myLocationAverageTemperatureLabel = myLocationAverageTemperatureLabel
        self.myLocationMinimumTemperatureLabel = myLocationMinimumTemperatureLabel
        self.myLocationMaximumTemperatureLabel = myLocationMaximumTemperatureLabel
    }
}

var weatherCardItemData: [WeatherCardItemData] = [
    
    .init(myLocationLabel: "나의 위치",
          myLocationNameLabel: "고양시",
          myLocationConditionLabel: "흐림",
          myLocationAverageTemperatureLabel: "21°",
          myLocationMinimumTemperatureLabel: "최저:15°",
          myLocationMaximumTemperatureLabel: "최고:29°"),
    
    .init(myLocationLabel: "나의 위치",
          myLocationNameLabel: "의정부시",
          myLocationConditionLabel: "흐림",
          myLocationAverageTemperatureLabel: "27°",
          myLocationMinimumTemperatureLabel: "최저:13°",
          myLocationMaximumTemperatureLabel: "최고:25°"),
    
        .init(myLocationLabel: "나의 위치",
              myLocationNameLabel: "노원시",
              myLocationConditionLabel: "흐림",
              myLocationAverageTemperatureLabel: "25°",
              myLocationMinimumTemperatureLabel: "최저:11°",
              myLocationMaximumTemperatureLabel: "최고:23°"),
    
        .init(myLocationLabel: "나의 위치",
              myLocationNameLabel: "부산광역시",
              myLocationConditionLabel: "흐림",
              myLocationAverageTemperatureLabel: "20°",
              myLocationMinimumTemperatureLabel: "최저:9°",
              myLocationMaximumTemperatureLabel: "최고:18°"),
    
        .init(myLocationLabel: "나의 위치",
              myLocationNameLabel: "고양시",
              myLocationConditionLabel: "흐림",
              myLocationAverageTemperatureLabel: "21°",
              myLocationMinimumTemperatureLabel: "최저:15°",
              myLocationMaximumTemperatureLabel: "최고:29°"),
    
        .init(myLocationLabel: "나의 위치",
              myLocationNameLabel: "의정부시",
              myLocationConditionLabel: "흐림",
              myLocationAverageTemperatureLabel: "27°",
              myLocationMinimumTemperatureLabel: "최저:13°",
              myLocationMaximumTemperatureLabel: "최고:25°"),
    
        .init(myLocationLabel: "나의 위치",
              myLocationNameLabel: "노원시",
              myLocationConditionLabel: "흐림",
              myLocationAverageTemperatureLabel: "25°",
              myLocationMinimumTemperatureLabel: "최저:11°",
              myLocationMaximumTemperatureLabel: "최고:23°"),
    
        .init(myLocationLabel: "나의 위치",
              myLocationNameLabel: "부산광역시",
              myLocationConditionLabel: "흐림",
              myLocationAverageTemperatureLabel: "20°",
              myLocationMinimumTemperatureLabel: "최저:9°",
              myLocationMaximumTemperatureLabel: "최고:18°")
    
]

