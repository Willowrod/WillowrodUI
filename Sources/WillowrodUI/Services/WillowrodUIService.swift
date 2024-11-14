//
//  File.swift
//  WillowrodUI
//
//  Created by Mike Hall on 13/11/2024.
//

import Foundation
import SwiftUI

@Observable
class WillowrodUIService {
    static let instance = WillowrodUIService()
    var overlay: (any View)? = nil
    var alert: (any View)? = nil
    var showSpinner = false
}

public func closeableOverlay(content: any View) {
    WillowrodUIService.instance.overlay = WillowrodOverlayCardView {
            ZStack(alignment: .topTrailing){
                AnyView(content)
                Button(action: {WillowrodUIService.instance.overlay = nil}){
                    Image(systemName: "xmark.circle").resizable().scaledToFit().frame(width: 30, height: 30).foregroundColor(colourRed)
                }.shadow(radius: 2)
            }.padding(10)
        }
}

public func overlay(content: any View) {
    WillowrodUIService.instance.overlay = WillowrodOverlayCardView {
            ZStack(alignment: .topTrailing){
                AnyView(content)
            }.padding(10)
        }
}

public func hideOverlay() {
    WillowrodUIService.instance.overlay = nil
}

public func clearAlert() {
    WillowrodUIService.instance.alert = nil
}

public func showSpinner() {
    WillowrodUIService.instance.showSpinner = true
}

public func hideSpinner() {
    WillowrodUIService.instance.showSpinner = false
}
