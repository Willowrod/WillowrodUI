//
//  SwiftUIView.swift
//  WillowrodUI
//
//  Created by Mike Hall on 13/11/2024.
//

import SwiftUI

public struct BaseContentView<Content: View>: View {
        public init(content: Content) {
            self.content = content
        }
    let wrdService = WillowrodUIService.instance
        @ViewBuilder var content: Content
    var shim = colourShim
    var background = colourWhite
    public var body: some View {
        
        GeometryReader{proxy in
            ZStack{
                content
                if let overlay = wrdService.overlay {
                    ZStack{
                        AnyView(overlay)
                    }.frame(maxWidth: .infinity, maxHeight: .infinity).background(shim)
                }
                if wrdService.showSpinner {
                    SpinnerView()
                }
                if let alert = wrdService.alert {
                    ZStack{
                        AnyView(alert)
                    }.frame(maxWidth: .infinity, maxHeight: .infinity).background(shim)
                }
            }.background(background).task(id: proxy.size) {
                SessionService.shared.screenWidth = proxy.size.width
                SessionService.shared.screenHeight = proxy.size.height
            }
        }
    }
}

struct SpinnerView: View {
 var shim = Color("Shim")
   var body: some View {
       VStack{
           HeaderText("Fetching Data")
           ProgressView().frame(width: 100, height: 100)
       }.frame(maxWidth: .infinity, maxHeight: .infinity).background(shim)
   }
}
