//
//  WeatherItemResponse.swift
//  weatherApp
//
//  Created by 김보연 on 12/5/23.
//


import Foundation

struct WeatherItemResponse: Codable {
    let weather: [Weather]
    let main: Main
    let name: String
    let timezone: Int
    
    enum CodingKeys: String, CodingKey {
        case weather
        case main
        case name
        case timezone
    }
}

struct Main: Codable {
    let temp, tempMin, tempMax: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
    
}

struct Weather: Codable {
    let main: String
    
    enum CodingKeys: CodingKey {
        case main
    }
}
