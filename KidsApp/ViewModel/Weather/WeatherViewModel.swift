//
//  WeatherViewModel.swift
//  Kidsapp
//
//  Created by Jacqueline Kolbe on 20.09.24.
//

import Foundation
import CoreLocation
import Combine

class WeatherViewModel: ObservableObject {
    @Published var temperature: String = ""
    @Published var humidity: String = ""
    @Published var weatherCondition: String = ""
    
    private let weatherService = WeatherService()
    
    func fetchWeather(for city: String) {
        weatherService.fetchWeather(for: city) { response in
            if let response = response {
                self.temperature = "\(Int(response.main.temp))°C"
                self.humidity = "Feuchtigkeit: \(Int(response.main.humidity))%"
                self.weatherCondition = response.weather.first?.main ?? "Unbekannt"
            } else {
                print("Keine Wetterdaten verfügbar.")
            }
        }
    }
    
    init() {
        fetchWeather(for: "Berlin")
    }
    
    func setWeatherImage(for condition: String) -> String {
        switch condition {
        case "Clear":
            return "clear_sky"
        case "Clouds":
            return "few_clouds"
        case "Rain":
            return "rain"
        case "Snow":
            return "snow"
        case "Thunderstorm":
            return "thunderstorm"
        case "Mist", "Fog":
            return "cloud.fog.fill"
        default:
            return "sun_icon"
        }
    }
}
