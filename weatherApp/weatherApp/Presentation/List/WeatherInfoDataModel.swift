//
//  WeatherInfoDataModel.swift
//  weatherApp
//
//  Created by 김보연 on 11/14/23.
//

import Foundation

// MARK: - Welcome
struct WeatherInfoDataModel: Codable {
    let weather: [Weather]
    let main: Main
    let name: String
    let timezone: Int
    
    enum CodingKeys: String, CodingKey {
        case weather
        case main
        case name = "name"
        case timezone
    }
}

// MARK: - Main
struct Main: Codable {
    let temp, tempMin, tempMax: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
    
}

// MARK: - Weather
struct Weather: Codable {
    let main: String
    
    enum CodingKeys: CodingKey {
        case main
    }
}


