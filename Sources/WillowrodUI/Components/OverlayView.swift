//
//  OverlayView.swift
//  Fighting Fantasy Tracker
//
//  Created by Mike Hall on 07/10/2024.
//

import Foundation
import SwiftUI

//public struct OverlayView<Content: View>: View {
//    public init(content: Content) {
//        self.content = content
//    }
//    @ViewBuilder var content: Content
//    public var body: some View {
//        VStack{
//            content
//        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center).padding(10).background(Color.clear)
//    }
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
//public struct OverlayCardView<Content: View>: View {
//    public init(content: Content) {
//        self.content = content
//    }
//    @ViewBuilder var content: Content
//    public var body: some View {
//        OverlayView(content:
//                        CardView(content:
//                    content
//            )
//        )
//    }
//}
//
//#Preview{
//    ZStack{
//        OverlayBoxView(content:
//            HeaderText("Boxed")
//        )
//    }.frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.red)
//}
