//
//  Array+Extensions.swift
//  Fighting Fantasy Tracker
//
//  Created by Mike Hall on 07/10/2024.
//


import Foundation

extension Array<Any>? {
    
    public func safeCount() -> Int {
        if let it = self {
            return it.count
        }
        return 0
    }
    
    public func isNilOrEmpty() -> Bool {
        if let it = self {
            return it.isEmpty
        }
        return true
    }
}
