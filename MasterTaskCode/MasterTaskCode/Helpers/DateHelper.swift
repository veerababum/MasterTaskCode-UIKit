//
//  DateHelper.swift
//  WeatherForecastApp
//
//  Created by AMRUT WAGHMARE on 28/08/23.
//

import Foundation
class DateHelper {
    static func dateFromString(dateString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.date(from: dateString) ?? Date()
    }
    
    static func stringFromDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.string(from: date)
    }
    
    static func getHourAndAMPMFromDateStr(_ dateString: String) -> (hour: Int, ampm: String)? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" // adjust the format according to your date string
        
        if let date = dateFormatter.date(from: dateString) {
            let calendar = Calendar.current
            let hour = calendar.component(.hour, from: date)
            let ampm = calendar.component(.hour, from: date) < 12 ? "AM" : "PM"
            return (hour, ampm)
        }
        
        return nil // Return nil if the date string couldn't be converted to a Date object
    }
    
    static func findDatesWithOneDayGap(dates: [Date]) -> [Date] {
        var result: [Date] = []
        var currentDate = dates.first ?? Date()
        for i in 0..<dates.count - 1 {
            let nextDate = dates[i+1]
            if let dayDifference = Calendar.current.dateComponents([.day], from: currentDate, to: nextDate).day, dayDifference == 1 {
                result.append(currentDate)
                currentDate = nextDate
            }
        }
        return result
    }
    
    static func dayFromDate(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: dateString) ?? Date()
        var weekday: String = ""
        dateFormatter.dateFormat = "cccc"
        weekday = dateFormatter.string(from: date)
        
        if Calendar.current.isDateInToday(date) {
            weekday = "Today"
            
        }
        return weekday
    }
}
