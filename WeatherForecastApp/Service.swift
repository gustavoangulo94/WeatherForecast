//
//  Service.swift
//  WeatherForecastApp
//
//  Created by Gustavo Angulo on 08/02/25.
//

import Foundation

struct City {
    let lat: String
    let lon: String
    let name: String
}

class Service {
    
    private let baseURL: String = "https://api.openweathermap.org/data/3.0/onecall"
    private let apiKey: String = "b600bd6d5ce070b3edabc2c03d7f2deb"
    private let session = URLSession.shared
    
    //função anonima no swift: () -> Void
    func fecthData(city: City, _ completion: @escaping (ForecastResponse?) -> Void){
        let urlString = "\(baseURL)?lat=\(city.lat)&lon=\(city.lon)&appid=\(apiKey)"
        guard let url = URL(string: urlString) else { return }
        let task = session.dataTask(with: url) { (data, response, error) in
            
            guard let data else {
                completion(nil)
                return
            }
            do {
                
            } catch {
                print(error)
                completion(nil)
            }
                
        }
        
        task.resume()
        
    }
}

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let forecastResponse = try? JSONDecoder().decode(ForecastResponse.self, from: jsonData)

// MARK: - ForecastResponse
struct ForecastResponse: Codable {
    let current: Forecast
    let hourly: [Forecast]
    let daily: [DailyForecast]
   
    enum CodingKeys: String, CodingKey {
        case current, hourly, daily
    }
}

// MARK: - Current
struct Forecast: Codable {
    let dt: Int
    let temp: Double
    let humidity: Int
    let windSpeed: Double
    let weather: [Weather]

    enum CodingKeys: String, CodingKey {
        case dt, temp, humidity
        case windSpeed = "wind_speed"
        case weather
    }
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, description, icon: String
}

// MARK: - Daily
struct DailyForecast: Codable {
    let dt: Int
    let temp: Temp
    let weather: [Weather]
}
// MARK: - Temp
struct Temp: Codable {
    let day, min, max, night: Double
    let eve, morn: Double
}

