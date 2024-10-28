//
//  WeatherService.swift
//  Kidsapp
//
//  Created by Jacqueline Kolbe on 27.09.24.
//

import Foundation


class WeatherService {
    private let apiKey = "bcde38ac7d340b68cb61e35ab86759c3"
    private let baseURL = "https://api.openweathermap.org/data/2.5/weather"

    func fetchWeather(for city: String, completion: @escaping (WeatherDataResponse?) -> Void) {
        guard let url = URL(string: "\(baseURL)?q=\(city)&appid=\(apiKey)&units=metric") else {
            print("Ungültige URL")
            return
        }

        print("Abfrage der Wetterdaten von: \(url)")

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Fehler bei der Datenabfrage: \(error.localizedDescription)")
                completion(nil)
                return
            }

            guard let data else {
                print("Keine Daten erhalten")
                completion(nil)
                return
            }

            print("Erhaltene Daten: \(String(describing: String(data: data, encoding: .utf8)))")

            do {
                let weatherResponse = try JSONDecoder().decode(WeatherDataResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(weatherResponse)
                }
            } catch {
                print("Fehler beim Parsen der Daten: \(error.localizedDescription)")
                completion(nil)
            }
        }.resume()
    }
}

