//
//  SessionService.swift
//  Fighting Fantasy Tracker
//
//  Created by Mike Hall on 07/10/2024.
//
import Foundation
import SwiftUI

/**
 *
 * SessionService - controls navigtion and views in the app
 *
 */
@Observable
public class SessionService {
    public static let shared = SessionService()
    public var isPortrait: Bool = UIDevice.current.orientation.isPortrait
    public var screenWidth: CGFloat = 0
    public var screenHeight: CGFloat = 0
}
