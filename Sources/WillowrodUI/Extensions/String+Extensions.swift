//
//  String+Extensions.swift
//  Fighting Fantasy Tracker
//
//  Created by Mike Hall on 07/10/2024.
//


import Foundation
import SwiftUI
import CoreImage.CIFilterBuiltins


public extension String {
    func toBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }
    
//    func imageFromBase64() -> CGImage? {
//        if let data = Data(base64Encoded: self) {
//            return CGImage(data: data)
//            //return UIImage(data: data)
//        }
//        return nil
//    }
    
    func fromBase64() -> String {
        if let data = Data(base64Encoded: self) {
            return String(data: data, encoding: .utf8) ?? ""
        }
        return ""
    }
    
    func isValidPhone() -> Bool {
        let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: self)
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func toAPIDate() -> Date? {
        standardFormatter().date(from: self)
    }

    func paymentToAPIDate() -> Date? {
        isoDateFormatter().date(from: self)
    }

    func toDate() -> Date {
        if let date = standardFormatter().date(from: self){
            return date
        }
        if let date = isoDateFormatter().date(from: self){
            return date
        }
        return Date()
    }

    func paymentToDate() -> Date {
        isoDateFormatter().date(from: self) ?? Date()
    }

    func toReadableDate() -> String {
        if let date = standardFormatter().date(from: self){
           return readableDateFormatter().string(from: date)
        }
        if let date = isoDateFormatter().date(from: self){
           return readableDateFormatter().string(from: date)
        }
        return self
    }
    
    func toReadableDateTime() -> String {
        if let date = tempDateFormatter().date(from: self){
           return dateTimeFormatter().string(from: date)
        }
        if let date = apiDateColonsFormatter().date(from: self){
           return dateTimeFormatter().string(from: date)
        }
        if let date = standardFormatter().date(from: self){
           return dateTimeFormatter().string(from: date)
        }
        if let date = isoDateFormatter().date(from: self){
           return dateTimeFormatter().string(from: date)
        }
        return self
    }
    
    func toSortableDate() -> String {
        if let date = standardFormatter().date(from: self){
           return isoDateFormatter().string(from: date)
        }
        if let date = isoDateFormatter().date(from: self){
           return isoDateFormatter().string(from: date)
        }
        return ""
    }

    func toReadableTimeOnDate() -> String {
        if let date = standardFormatter().date(from: self){
           return timeOnDateFormatter().string(from: date)
        }
        return ""
    }
    
    func masked(with: String = "*") -> String {
        return String(repeating: with, count: self.count)
    }

//    func toSafeColour() -> Color {
//        if self == "#000000" {
//            return Color.green
//        }
//        return Color(hex: self)
//    }
    
    func addNewLine(_ line: String?) -> String {
        if let line, line != "-" {
            if self.isEmpty{
                return line
            }
            return "\(self)\n\(line)"
        }
        return self
    }
    
    func toQRCode() -> CGImage? {

        let filter = CIFilter.qrCodeGenerator()
        filter.message = Data(self.utf8)
        if let outputImage = filter.outputImage, let cgImage = CIContext().createCGImage(outputImage, from: outputImage.extent) {
            return cgImage
            }

        return nil
//            let data = self.data(using: String.Encoding.ascii)
//
//        if let QRFilter = CIFilter(name: "CIQRCodeGenerator") {
//              QRFilter.setValue(data, forKey: "inputMessage")
//              guard let QRImage = QRFilter.outputImage else {return nil}
//              return UIImage(ciImage: QRImage)
//          }
//          return nil
      }
    
    
}
