//
//  SwiftUIMagic.swift
//  Fighting Fantasy Tracker
//
//  Created by Mike Hall on 07/10/2024.
//


import Foundation
import SwiftUI

public extension View {
    func `if`<Content: View>(_ conditional: Bool, content: (Self) -> Content) -> some View {
        if conditional {
            return AnyView(content(self))
        } else {
            return AnyView(self)
        }
    }
    
#if os(iOS)
    func dismisskeyboard() -> some View {
        if #available(iOS 16.0, *) {
            return AnyView(self.scrollDismissesKeyboard(.interactively))
        } else {
            return AnyView(self)
        }
    }
    
    func autoCap(type: TextInputAutocapitalization) -> some View {
        return AnyView(self.textInputAutocapitalization(type))
    }
    
    func keyboard(type: KeyboardType) -> some View {
        switch type {
        case .text:
            return AnyView(self)
        case .numeric:
            return AnyView(self.keyboardType(UIKeyboardType.numberPad))
        case .phone:
            return AnyView(self.keyboardType(UIKeyboardType.phonePad))
        case .email:
            return AnyView(self.keyboardType(UIKeyboardType.emailAddress))
        }
    }
#endif
    func tappable(_ action: (() -> Void)?) -> some View {
        if let action {
            return AnyView(self.onTapGesture {
                action()
            })
        } else {
            return AnyView(self)
        }
    }
    
    func tappableWithReturn<T>(_ action: ((T) -> Void)?, item: T) -> some View {
        if let action {
            return AnyView(self.onTapGesture {
                action(item)
            })
        } else {
            return AnyView(self)
        }
    }
    
    func fill(_ alignment: Alignment = .center) -> some View{
        return AnyView(self.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: alignment))
    }
    
    func fillWidth(_ alignment: Alignment = .center) -> some View{
        return AnyView(self.frame(minWidth: 0, maxWidth: .infinity, alignment: alignment))
    }
}
