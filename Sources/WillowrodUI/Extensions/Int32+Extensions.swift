//
//  Int32+Extensions.swift
//  Fighting Fantasy Tracker
//
//  Created by Mike Hall on 07/10/2024.
//


import Foundation

public extension Int? {
    func nextInt(cap: Int = Int.max, capReachedReturn: Int = -1) -> Int {
        if let it = self {
            if (cap == it){
                return capReachedReturn
            }
            return it + 1
        }
        return 0
    }

    func lastInt(cap: Int = 0, capReachedReturn: Int = -1) -> Int {
        if let it = self {
            if (cap == it){
                return capReachedReturn
            }
            return it - 1
        }
        return capReachedReturn
    }
}

public extension Int {
    func nextInt(cap: Int = Int.max, capReachedReturn: Int = -1) -> Int {
            if (cap == self){
                return capReachedReturn
            }
            return self + 1
    }

    func lastInt(cap: Int = 0, capReachedReturn: Int = -1) -> Int {
            if (cap == self){
                return capReachedReturn
            }
            return self - 1
    }
    
    func plus(_ bool: Bool) -> Int {
        if bool {
            return self + 1
        }
        return self
    }
}
