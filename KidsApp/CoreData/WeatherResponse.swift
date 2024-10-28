//
//  WeatherData.swift
//  Kidsapp
//
//  Created by Jacqueline Kolbe on 27.09.24.
//

import Foundation

struct WeatherDataResponse: Codable {

    var main: MainData
    var weather: [WeatherDetails]
}

struct MainData: Codable {
    let temp: Double
    let humidity: Double
    let temp_min: Double
    let temp_max: Double
}

struct WeatherDetails: Codable {
    var main: String
}





//struct WeatherDataResponse: Codable {
//    let coord: Coord
//    let weather: [Weather]
//    let main: Main
//    let visibility: Int?
//    let wind: Wind
//    let clouds: Clouds
//    let sys: Sys
//    let name: String
//}
//
//struct Coord: Codable {
//    let lon: Double
//    let lat: Double
//}

//struct Weather: Codable {
//    let id: Int
//    let main: String
//    let description: String
//    let icon: String
//}
//
//struct Main: Codable {
//    let temp: Double
//    let feels_like: Double
//    let temp_min: Double
//    let temp_max: Double
//    let pressure: Int
//    let humidity: Int
//    let sea_level: Int?
//    let grnd_level: Int?
//}
//
//struct Wind: Codable {
//    let speed: Double
//    let deg: Int
//    let gust: Double?
//}
//
//struct Clouds: Codable {
//    let all: Int
//}
//
//struct Sys: Codable {
//    let type: Int?
//    let id: Int?
//    let country: String
//    let sunrise: Int
//    let sunset: Int
//}

