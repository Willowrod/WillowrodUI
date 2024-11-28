//
//  AppConstants.swift
//  Fighting Fantasy Tracker
//
//  Created by Mike Hall on 07/10/2024.
//


import SwiftUI

#if os(iOS)
var idiom : UIUserInterfaceIdiom { UIDevice.current.userInterfaceIdiom }
public let isiPad = idiom == .pad
public let idealPopupWidth = isiPad ? 500.0 : .infinity
public let idealFieldWidth = isiPad ? 600.0 : .infinity
#else
public let isiPad = false
public let idealPopupWidth: CGFloat = .infinity
public let idealFieldWidth: CGFloat = .infinity
#endif
public let apiDateFormat = "yyyy-MM-dd'T'HHmmss"
public let apiDateColonsFormat = "yyyy-MM-dd'T'HH:mm:ss"
public let isoDateFormat = "yyyy-MM-dd"
public let tempDateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSS"
public let readableDateFormat = "dd/MM/yyyy"
public let readableDateTimeFormat = "dd/MM/yyyy HH:mm"
public let readableTimeOnDateFormat = "HH:mm 'on' dd/MM/yyyy"
public let hourOnlyFormatter = "HH"

public let oneSecond = 1.0
public let oneMinute = oneSecond * 60
public let oneHour = oneMinute * 60
public let oneDay = oneHour * 24
public let accessTokenTimeout = oneMinute * 55
public let refreshTokenTimeout = oneDay * 89

public func customFormatter(_ pattern: String) -> DateFormatter {
    let df = DateFormatter()
    df.dateFormat = pattern
    //df.timeZone = TimeZone(abbreviation: "UTC")
    return df
}

public func standardFormatter() -> DateFormatter {
    let df = DateFormatter()
    df.dateFormat = apiDateFormat
    df.timeZone = TimeZone(abbreviation: "UTC")
    return df
}

public func standardFormatterMidnight() -> DateFormatter {
    let df = DateFormatter()
    df.dateFormat = "yyyy-MM-dd'T'00-00-00.0000'Z'"
    df.timeZone = TimeZone(abbreviation: "UTC")
    return df
}

public func isoDateFormatter() -> DateFormatter {
    let df = DateFormatter()
    df.dateFormat = isoDateFormat
    df.timeZone = TimeZone(abbreviation: "UTC")
    return df
}

public func tempDateFormatter() -> DateFormatter {
    let df = DateFormatter()
    df.dateFormat = tempDateFormat
    df.timeZone = TimeZone(abbreviation: "UTC")
    return df
}

public func readableDateFormatter() -> DateFormatter {
    let df = DateFormatter()
    df.dateFormat = readableDateFormat
    df.timeZone = TimeZone(abbreviation: "UTC")
    return df
}

public func timeOnDateFormatter() -> DateFormatter {
    let df = DateFormatter()
    df.dateFormat = readableTimeOnDateFormat
    df.timeZone = TimeZone(abbreviation: "UTC")
    return df
}

public func dateTimeFormatter() -> DateFormatter {
    let df = DateFormatter()
    df.dateFormat = readableDateTimeFormat
    df.timeZone = TimeZone(abbreviation: "UTC")
    return df
}

public func apiDateColonsFormatter() -> DateFormatter {
    let df = DateFormatter()
    df.dateFormat = apiDateColonsFormat
    df.timeZone = TimeZone(abbreviation: "UTC")
    return df
}



public enum KeyboardType {
    case text, numeric, phone, email
}


