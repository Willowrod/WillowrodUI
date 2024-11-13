//
//  File.swift
//  Mibrary
//
//  Created by Mike Hall on 20/10/2024.
//

import Foundation
import SwiftData

public extension ModelContext {
    func safeSave() {
        do {
            try save()
        } catch {
            print("Could not save: \(error)")
        }
    }
}
