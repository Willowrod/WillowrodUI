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
    var enabled: Bool
    let action: () -> Void
    
    public init(_ text: String, width: CGFloat? = nil, enabled: Bool = true, action: @escaping () -> Void) {
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
            
    }
}


