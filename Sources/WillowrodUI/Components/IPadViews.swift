//
//  IPadViews.swift
//  Fighting Fantasy Tracker
//
//  Created by Mike Hall on 07/10/2024.
//

import SwiftUI

public struct IPadHorizontalScroll<Content: View>: View {
    
    public init(content: Content) {
        self.content = content
    }
    
    @ViewBuilder var content: Content
    public var body: some View {
        HStack(alignment: .top){
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 10) {
                    content
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}

public struct IPadColumn<Content: View>: View {
    public init(title: String, background: Color, content: Content) {
        self.title = title
        self.background = background
        self.content = content
    }
    
    let title: String
    var background: Color = Color.gray
    @ViewBuilder var content: Content
    public var body: some View {
        VStack{
            HeaderText( title)
            ScrollView(showsIndicators: false){
                VStack(spacing: 10) {
                    content
                }
                .frame(minWidth: 400, maxWidth: 400, maxHeight: .infinity).background(background)
            }.padding(.bottom, 10)
        }
    }
}

public struct IPadCapsule<Content: View>: View {
    public init(background: Color = .gray, content: Content) {
        self.background = background
        self.content = content
    }
    var background: Color = Color.gray
    @ViewBuilder var content: Content
    public var body: some View {
        VStack(alignment: .leading, spacing: 10){
            content
        }.padding(10).background(background).clipShape(RoundedRectangle(cornerRadius: 10))
    }
}






#Preview {
//    IPadHorizontalScroll {
//        HeaderText( "Text")
//    }
    IPadHorizontalScroll(content: HeaderText("Text"))
}
