//
//  LoggingService.swift
//  Fighting Fantasy Tracker
//
//  Created by Mike Hall on 07/10/2024.
//

import Foundation
import OSLog

public class LoggingService {
    @MainActor static let instance = LoggingService()
    
    func logN(_ item: String){
#if DEBUG
        Logger.network.info("\(item)")
#endif
    }
    
    func logNE(_ item: String){
#if DEBUG
        Logger.network.error("\(item)")
#endif
    }
    
    func logN(_ item: Error){
        Logger.network.info("\(item.localizedDescription)")
    }
    
    func log(_ item: String){
#if DEBUG
        Logger.defaultDebug.info("\(item)")
#endif
    }
    
    func logError(_ item: String){
        Logger.defaultDebug.error("\(item)")
    }
    
    func log(_ item: Error){
        Logger.defaultDebug.error("\(item.localizedDescription)")
    }
    
    func log(_ item: [String]){
#if DEBUG
        item.forEach{string in
            Logger.defaultDebug.info("\(string)")
        }
#endif
    }
}

extension Logger {
    /// Using your bundle identifier is a great way to ensure a unique identifier.
    @MainActor private static var subsystem = Bundle.main.bundleIdentifier!

    /// Logs the view cycles like a view that appeared.
    @MainActor static let viewCycle = Logger(subsystem: subsystem, category: "viewcycle")

    /// All logs related to tracking and analytics.
    @MainActor static let statistics = Logger(subsystem: subsystem, category: "statistics")
    
    /// All logs related to tracking and analytics.
    @MainActor static let network = Logger(subsystem: subsystem, category: "network")
    
    /// All logs related to tracking and analytics.
    @MainActor static let defaultDebug = Logger(subsystem: subsystem, category: "-")
}
