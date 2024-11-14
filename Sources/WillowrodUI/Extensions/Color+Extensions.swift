//
//  File.swift
//  WillowrodUI
//
//  Created by Mike Hall on 13/11/2024.
//

import Foundation
import SwiftUI

extension Color{
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted).replacingOccurrences(of: "#", with: "")
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
    
  
}

let colourRed = Color(hex: "FF0000")
 let colourBlack = Color(hex: "000000")
let colourShim = Color(hex: "000000").opacity(0.7)
 let colourWhite = Color(hex: "FFFFFF")
 let colourPositive = Color(hex: "32CD32")
 let colourNegative = Color(hex: "FF0000")
