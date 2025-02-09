//
//  Core+Extensions.swift
//  WeatherForecastApp
//
//  Created by Gustavo Angulo on 09/02/25.
//

import Foundation

var weekDayName = ""
extension Int {
    
    func toWeekdayName() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        
        let dateFormatter = DateFormatter()
        var dateName = ""
        dateFormatter.dateFormat = "EEE" // "EE" represents the full weekday name
        dateName = translateWeekday(dateFormatter.string(from: date))
        
        return dateName
    }
    
    func translateWeekday(_ dayInEnglish: String) -> String {
        let weekdays: [String: String] = [
            "Mon": "Seg",
            "Tue": "Teg",
            "Wed": "Qua",
            "Thu": "Qui",
            "Fri": "Sex",
            "Sat": "Sáb",
            "Sun": "Dom"
        ]
        
        weekDayName = weekdays[dayInEnglish] ?? dayInEnglish
        
        return weekDayName
    }

    
    func toHourFormat() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm" // "HH:mm" represents the 24-hour format
        
        return dateFormatter.string(from: date)
    }
    
    func isDayTime() -> Bool {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let hour = Calendar.current.component(.hour, from: date)
        
        let dayStartHour = 6
        let dayEndHour = 18
        
        return hour >= dayStartHour && hour < dayEndHour
    }
}

extension Double {
    func toCelsius () -> String {
        "\(Int(self))°C"
    }
}

extension String {
    
       
}
