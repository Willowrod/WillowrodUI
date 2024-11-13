//
//  CGFloat+Extensions.swift
//  Fighting Fantasy Tracker
//
//  Created by Mike Hall on 07/10/2024.
//


import Foundation

extension Comparable {
    public func clamped(to limits: ClosedRange<Self>) -> Self {
        return min(max(self, limits.lowerBound), limits.upperBound)
    }
}
