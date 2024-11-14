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
