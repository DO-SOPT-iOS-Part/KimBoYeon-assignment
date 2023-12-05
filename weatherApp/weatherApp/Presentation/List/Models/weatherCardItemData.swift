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
    let myLocationAverageTemperatureLabel: Int
    let myLocationMinimumTemperatureLabel: Int
    let myLocationMaximumTemperatureLabel: Int
    
    init(myLocationLabel: String, myLocationNameLabel: String, myLocationConditionLabel: String, myLocationAverageTemperatureLabel: Int, myLocationMinimumTemperatureLabel: Int, myLocationMaximumTemperatureLabel: Int) {

        self.myLocationLabel = myLocationLabel
        self.myLocationNameLabel = myLocationNameLabel
        self.myLocationConditionLabel = myLocationConditionLabel
        self.myLocationAverageTemperatureLabel = myLocationAverageTemperatureLabel
        self.myLocationMinimumTemperatureLabel = myLocationMinimumTemperatureLabel
        self.myLocationMaximumTemperatureLabel = myLocationMaximumTemperatureLabel
    }
}
