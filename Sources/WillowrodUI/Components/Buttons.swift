//
//  SwiftUIView.swift
//  WillowrodUI
//
//  Created by Mike Hall on 20/10/2024.
//

import SwiftUI

public struct MainButton: View {
    let text: String
    var width: CGFloat?
    var fullWidth: Bool = false
    var height: CGFloat = 44
    var colour: Color = Color("Clear")
    var textColour: Color = Color("Black")
    var enabled: Bool
    let action: () -> Void
    
    public init(_ text: String, width: CGFloat? = nil, fullWidth: Bool = false, height: CGFloat = 44, colour: Color = Color("Clear"), textColour: Color = Color("Black"), enabled: Bool = true, action: @escaping () -> Void) {
        self.text = text
        self.width = width
        self.enabled = enabled
        self.action = action
    }
    
   public var body: some View {
        ZStack(alignment: .center) {
            HeaderText(text, size: 12).padding(10)
        }.if(width != nil){$0.frame(width: width)}
           .border(Color.black, width: 1)
           .if(enabled){
            $0.tappable{
                action()
        }
           }
           .if(!enabled){
               $0.background(.gray)
           }
           .contentShape(Rectangle())
    }
    
}
   

public struct PositiveButton: View {
   public init(text: String, fullWidth: Bool, height: CGFloat = 44, width: CGFloat? = nil, enabled: Bool = true, action: @escaping () -> Void) {
        self.text = text
        self.fullWidth = fullWidth
        self.height = height
        self.width = width
        self.enabled = enabled
        self.action = action
    }
    let text: String
    var fullWidth: Bool = false
    var height: CGFloat = 44
    var width: CGFloat? = nil
    var enabled: Bool = true
    let action: () -> Void
    public var body: some View {
        MainButton(text, width: width, fullWidth: fullWidth, height: height, colour: Color("Positive"), textColour: Color("White"), enabled: enabled, action: action)
    }
}

public struct NegativeButton: View {
   public init(text: String, height: CGFloat = 44, width: CGFloat? = nil, action: @escaping () -> Void) {
       self.text = text
       self.height = height
       self.width = width
       self.action = action
   }
    let text: String
    var height: CGFloat = 44
    var width: CGFloat? = nil
    let action: () -> Void
    public var body: some View {
        MainButton(text, width: width, height: height, colour: Color("Negative"), action: action)
    }
}


