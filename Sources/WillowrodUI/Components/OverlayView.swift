//
//  OverlayView.swift
//  Fighting Fantasy Tracker
//
//  Created by Mike Hall on 07/10/2024.
//

import Foundation
import SwiftUI

struct WillowrodOverlayCardView<Content: View>: View {
    @ViewBuilder var content: Content
    public var body: some View {
        WillowrodOverlayView{
            WillowrodCardView{
                content
            }
        }
    }
}

struct WillowrodOverlayView<Content: View>: View {
    @ViewBuilder var content: Content
    public var body: some View {
        VStack{
            content
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center).padding(10).background(.clear)
    }
}

struct WillowrodCardView<Content: View>: View {
    @ViewBuilder var content: Content
    
    public var body: some View {
        ZStack {
            content
        }.background(colourWhite).clipShape(RoundedRectangle(cornerRadius: 10)).shadow(radius: 2)
        
    }
}

//
//func closeableOverlay(content: any View) {
//        SessionService.shared.overlay = WillowrodOverlayCardView {
//            ZStack(alignment: .topTrailing){
//                AnyView(content)
//                Button(action: {AppViewsService.shared.overlay = nil}){
//                    Image(systemName: "xmark.circle").resizable().scaledToFit().frame(width: 44, height: 44).foregroundColor(.red)
//                }.shadow(radius: 2)
//            }.padding(10)
//        }
//}
//
//func fullScreenOverlay(content: any View) {
//        AppViewsService.shared.overlay = OverlayCardView {
//                AnyView(content)
//            }.padding(10).frame(maxWidth: .infinity, maxHeight: .infinity)
//        }
//
//func mainOverlay(content: any View) {
//        AppViewsService.shared.overlay = OverlayCardView {
//                AnyView(content)
//        }
//}


//
//public struct OverlayBoxView<Content: View>: View {
//    public init(content: Content) {
//        self.content = content
//    }
//    @ViewBuilder var content: Content
//    public var body: some View {
//        OverlayView(content:
//            VStack{
//                content
//            }.padding(10).background(Color.white).border(Color.black)
//        )
//    }
//}
//
//
//
//
//#Preview{
//    ZStack{
//        OverlayBoxView(content:
//            HeaderText("Boxed")
//        )
//    }.frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.red)
//}
