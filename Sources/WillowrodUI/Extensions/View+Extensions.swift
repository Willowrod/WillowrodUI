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

//    func iPad<Content: View>(content: (Self) -> Content) -> some View {
//        if idiom == .pad {
//            return AnyView(content(self))
//        } else {
//            return AnyView(self)
//        }
//    }
//    
//    func iphone<Content: View>(content: (Self) -> Content) -> some View {
//        if idiom == .phone {
//            return AnyView(content(self))
//        } else {
//            return AnyView(self)
//        }
//    }
    
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

    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }

//    func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
//      background(
//        GeometryReader { geometryProxy in
//          Color.clear
//            .preference(key: SizePreferenceKey.self, value: geometryProxy.size)
//        }
//      )
//      .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
//    }

//    @ViewBuilder
//    func forceRotation(orientation: UIInterfaceOrientationMask) -> some View {
//        self.onAppear() {
//            AppDelegate.orientationLock = orientation
//        }
//    }
    
    func snapshot() -> UIImage? {
        let controller = NoInsetHostingView(rootView: self)
        controller.fix()
        guard let view = controller.view else {
            return nil
        }
          let targetSize = controller.view.intrinsicContentSize
          view.bounds = CGRect(origin: .zero, size: targetSize)
          view.backgroundColor = .clear

          let renderer = UIGraphicsImageRenderer(size: targetSize)

          return renderer.image { _ in
              view.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
          }
     }
    
//    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
//        self.modifier(DeviceRotationViewModifier(action: action))
//    }
    
}

private struct SizePreferenceKey: @preconcurrency PreferenceKey {
    @MainActor static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
  }

public struct RoundedCorner: InsettableShape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    var insetAmount = 3.0
    public func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
    public func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}

class NoInsetHostingView<Content: View>: UIHostingController<Content> {
    func fix(){
        guard let _class = view?.classForCoder else { return }
        let sAI: @convention(block) (AnyObject) -> UIEdgeInsets = { (sself : AnyObject!) -> UIEdgeInsets in
            return .zero
        }
        guard let method = class_getInstanceMethod(_class.self, #selector(getter: UIView.safeAreaInsets)) else { return }
        class_replaceMethod(_class, #selector(getter: UIView.safeAreaInsets), imp_implementationWithBlock(sAI), method_getTypeEncoding(method))
        
        let sALG: @convention(block) (AnyObject) -> UILayoutGuide? = { (sself : AnyObject!) -> UILayoutGuide? in
            return nil
        }
        
        guard let method2 = class_getInstanceMethod(_class.self, #selector(getter: UIView.safeAreaLayoutGuide)) else { return }
        class_replaceMethod(_class, #selector(getter: UIView.safeAreaLayoutGuide), imp_implementationWithBlock(sALG), method_getTypeEncoding(method2))
        
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
