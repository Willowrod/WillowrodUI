//
//  Date+Extensions.swift
//  Fighting Fantasy Tracker
//
//  Created by Mike Hall on 07/10/2024.
//


import Foundation

public extension Date {
    func toAPIString() -> String {
        standardFormatter().string(from: self)
    }
    
    func toAPIColonsString() -> String {
        apiDateColonsFormatter().string(from: self)
    }
    
    func toIsoDate() -> String {
        isoDateFormatter().string(from: self)
    }

    func toMidnight() -> Date {
        let temp = standardFormatterMidnight().string(from: self) 
        if let midnight = temp.toAPIDate() {
            return midnight
        }
        return Date()
    }

    func withDaysDifference(_ days: Int) -> Date {
        return self.addingTimeInterval(60*60*24*Double(days))
    }
    
    func salutation() -> String {
        let hour = customFormatter(hourOnlyFormatter).string(from: self)
        guard let hourInt = Int(hour) else {
            return "Hello"
        }
        switch hourInt {
        case 6...11:
            return "Good morning"
        case 12...18:
            return "Good afternoon"
        default:
            return "Good evening"
        }
    }
    
    func toReadableDate() -> String {
        standardFormatter().string(from: self).toReadableDate()
    }
    
    func age() -> String {
        let now = Date.now
        let years = Calendar.current.dateComponents([.year], from: self, to: .now).year!
        if years == 1 {
            return "\(years) year"
        }
        if years > 1 {
            return "\(years) years"
        }
        let months = Calendar.current.dateComponents([.month], from: self, to: .now).month!
        if months == 1 {
            return "\(months) month"
        }
        if months > 1 {
            return "\(months) months"
        }
        let days = Calendar.current.dateComponents([.day], from: self, to: .now).day!
        if days == 1 {
            return "\(days) day"
        }
            return "\(days) days"
    }
}
