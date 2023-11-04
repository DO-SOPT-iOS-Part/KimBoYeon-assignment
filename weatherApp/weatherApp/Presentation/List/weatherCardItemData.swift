//
//  weatherCardData.swift
//  weatherApp
//
//  Created by 김보연 on 11/2/23.
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
