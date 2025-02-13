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
        let urlString = "\(baseURL)?lat=\(city.lat)&lon=\(city.lon)&appid=\(apiKey)&units=metric"
        guard let url = URL(string: urlString) else { return }
    
        let task = session.dataTask(with: url) { (data, response, error) in
            guard let data else {
                completion(nil)
                return
            }
            do {
                let forecastResponse = try JSONDecoder().decode(ForecastResponse.self, from: data)
                completion(forecastResponse)
            } catch {
                completion(nil)
            }
        }
        task.resume()
    }
}

// MARK: - ForecastResponse
struct ForecastResponse: Decodable {
    let current: Forecast
    let hourly: [Forecast]
    let daily: [DailyForecast]
}

// MARK: - Current
struct Forecast: Decodable {
    let dt: Int
    let temp: Double
    let humidity: Int
    let windSpeed: Double
   private let weatherOrigin: [Weather]
    var weather: Weather {
        return weatherOrigin.first ?? Weather(id: 0, main: "", description: "", icon: "")
    }

    enum CodingKeys: String, CodingKey {
        case dt, temp, humidity
        case windSpeed = "wind_speed"
        case weatherOrigin = "weather"
    }
}

// MARK: - Weather
struct Weather: Decodable {
    let id: Int
    let main, description, icon: String
}

// MARK: - Daily
struct DailyForecast: Decodable {
    let dt: Int
    let temp: Temp
    let weather: Weather?
       
    
    enum CodingKeys: CodingKey {
        case dt
        case temp
        case weather
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.dt = try container.decode(Int.self, forKey: .dt)
        self.temp = try container.decode(Temp.self, forKey: .temp)
        self.weather = try container.decode([Weather].self, forKey: .weather).first
    }
    
}
// MARK: - Temp
struct Temp: Decodable {
    let day, min, max, night: Double
    let eve, morn: Double
}



