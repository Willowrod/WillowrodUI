//
//  Double+Formatting.swift
//  Fighting Fantasy Tracker
//
//  Created by Mike Hall on 07/10/2024.
//


import Foundation

public extension Double {
    func formatToGBP(twoDP: Bool = true) -> String{
        var format: String = ""
        if twoDP {
            format = self.formattedWithSeparator
        } else {
            format = self.formattedWithSeparatorNoFraction
        }
        return "£\(format)"
    }
}

public extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.groupingSeparator = ","
        return formatter
    }()

    static let withSeparatorNoFraction: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 0
        formatter.roundingMode = .down
        formatter.groupingSeparator = ","
        return formatter
    }()
}

public extension Numeric {
    var formattedWithSeparator: String { Formatter.withSeparator.string(for: self) ?? "" }
    var formattedWithSeparatorNoFraction: String { Formatter.withSeparatorNoFraction.string(for: self) ?? "" }
}
