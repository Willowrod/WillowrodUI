//
//  File.swift
//  WillowrodUI
//
//  Created by Mike Hall on 13/11/2024.
//

import Foundation
import SwiftUI

@Observable
public class WillowrodUIService {
    public static let instance = WillowrodUIService()
    var overlay: (any View)? = nil
    var overlayStack: [(any View)] = []
    var alert: (any View)? = nil
    var showSpinner = false
    
    public func addOverlay(_ newOverlay: (any View)) {
        if let overlay {
            self.overlayStack.append(overlay)
        }
        overlay = newOverlay
    }
    
    public func changeOverlay(_ newOverlay: (any View)) {
        overlayStack.removeAll()
        overlay = newOverlay
    }
    
    public func restoreOverlay(_ animated: Bool = true) {
        if overlayStack.isEmpty {
            overlay = nil
        } else {
            overlay = overlayStack.removeLast()
        }
    }
    
    func emptyOverlay() {
        overlayStack.removeAll()
        overlay = nil
    }
}

public func closeableOverlay(content: any View) {
    let service = WillowrodUIService.instance
    service.addOverlay(WillowrodOverlayCardView {
        VStack(alignment: .trailing){
            Button(action: {service.restoreOverlay()}){
                    Image(systemName: "xmark.circle").resizable().scaledToFit().frame(width: 20, height: 20).foregroundColor(colourRed)
                }.shadow(radius: 2)
                AnyView(content)
            }.padding(10)
        })
}

public func overlay(content: any View) {
    let service = WillowrodUIService.instance
    service.addOverlay(WillowrodOverlayCardView {
            ZStack(alignment: .topTrailing){
                AnyView(content)
            }.padding(10)
        })
}

public func hideOverlay() {
    WillowrodUIService.instance.restoreOverlay()
}

public func clearOverlay() {
    WillowrodUIService.instance.emptyOverlay()
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
