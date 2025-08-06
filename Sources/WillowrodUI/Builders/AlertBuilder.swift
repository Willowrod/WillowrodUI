//
//  AlertBuilder.swift
//  Competency Cloud
//
//  Created by Mike Hall on 05/11/2024.
//

import Foundation
import SwiftUI

public class AlertBuilder {
    init(components: [AlertComponent], buttons: [AlertComponent]) {
        self.components = components
        self.buttons = buttons
    }
    var components: [AlertComponent] = []
    var buttons: [AlertComponent] = []
    
    public class Builder {
        
        public init() {
            self.components = []
            self.buttons = []
            self._order = 0
        }
        
        var components: [AlertComponent] = []
        var buttons: [AlertComponent] = []
        var _order = 0
        
        public func order() -> Int {
            let cOrder = _order
            _order += 1
            return cOrder
        }
        
        public func title () -> Builder {
            self.components.append(AlertComponent(type: .Header, text: (Bundle.main.infoDictionary!["CFBundleName"] as! String), order: order()))
            return self
        }
        
        public func title (_ text: String, size: CGFloat? = nil) -> Builder {
            self.components.append(AlertComponent(type: .Header, text: text, order: order(), size: size))
            return self
        }
        
        public func body (_ text: String, size: CGFloat? = nil) -> Builder {
            self.components.append(AlertComponent(type: .Body, text: text, order: order(), size: size))
            return self
        }
        
        public func image (_ image: String, size: CGFloat? = nil) -> Builder {
            self.components.append(AlertComponent(type: .Image, image: image, order: order(), size: size))
            return self
        }
        
        public func systemImage (_ image: String, size: CGFloat? = nil) -> Builder {
            self.components.append(AlertComponent(type: .SystemImage, image: image, order: order(), size: size))
            return self
        }
        
        public func positive (_ text: String, fullWidth: Bool = false, width: CGFloat? = nil, action: @escaping (() -> Void)) -> Builder {
            self.buttons.append(AlertComponent(type: .PositiveButton, text: text, order: order(), size: width, fullWidth: fullWidth, action: action))
            return self
        }
        
        public func negative (_ text: String, width: CGFloat? = nil, action: @escaping (() -> Void)) -> Builder {
            self.buttons.append(AlertComponent(type: .NegativeButton, text: text, order: order(), size: width, action: action))
            return self
        }
        
        public func ok (width: CGFloat = 120) -> Builder {
            self.buttons.append(AlertComponent(type: .PositiveButton, text: "OK", order: order(), size: width){
                clearAlert()
            })
            return self
        }
        
        public func ok (width: CGFloat = 120, fullWidth: Bool = true, action: @escaping (() -> Void)) -> Builder {
            self.buttons.append(AlertComponent(type: .PositiveButton, text: "OK", order: order(), size: width, fullWidth: fullWidth){
                action()
                clearAlert()
            })
            return self
        }
        
        public func cancel (width: CGFloat = 120) -> Builder {
            self.buttons.append(AlertComponent(type: .NegativeButton, text: "Cancel", order: order(), size: width){
                clearAlert()
            })
            return self
        }
        
        public func build() {
                DispatchQueue.main.async {
                    WillowrodUIService.instance.alert =
                    WillowrodOverlayCardView {
                        AlertBuild(components: self.components, buttons: self.buttons)
                    }
                }
        }
    }
    
    static public func close() {
        clearAlert()
    }
    
}

struct AlertBuild: View {
    let components: [AlertComponent]
    let buttons: [AlertComponent]
    var body: some View {
                VStack(alignment: .center, spacing: 8){
                    let c = components.sorted(by: {$0.order < $1.order})
                    ForEach(c, id: \.id) { component in
                        switch component.type {
                           case .Header:
                            HeaderText(component.text, size: component.size ?? 18)
                        case .Body:
                            SecondaryText(component.text, size: component.size ?? 14)
                        case .Image:
                            AlertImage(image: component.image, size: component.size, isSystem: false)
                        case .SystemImage:
                            AlertImage(image: component.image, size: component.size, isSystem: true)
                        default:
                            HeaderText("Nah")
                        }
                    }
                    
                    HStack(spacing: 8){
                        ForEach(buttons, id: \.id) { component in
                            switch component.type {
                            case .PositiveButton:
                                PositiveButton(text: component.text, fullWidth: component.fullWidth, width: component.size, action: component.action)
                            case .NegativeButton:
                                NegativeButton(text: component.text, width: component.size, action: component.action)
                            default:
                                HeaderText("Nah")
                            }
                        }
                    }.frame(maxWidth: .infinity, alignment: .trailing)
                    
                    
                }.frame(maxWidth: 500, minHeight: 30).padding(4).background(colourWhite)
    }
}

struct AlertImage: View {
    let image: String?
    let size: CGFloat?
    let isSystem: Bool
    var body: some View {
        if (!isSystem){
            if let size{
                Image(image ?? "").resizable().scaledToFit().frame(width: size, height: size)
            } else {
                Image(image ?? "")
            }
        } else {
            if let size{
                Image(systemName: image ?? "").resizable().scaledToFit().frame(width: size, height: size)
            } else {
                Image(systemName: image ?? "")
            }
        }
                       
    }
}

struct AlertComponent {
    init(type: AlertComponentType, text: String? = nil, image: String? = nil, order: Int, size: CGFloat? = nil, fullWidth: Bool = false, action: (() -> Void)? = nil) {
        self.id = UUID()
        self.type = type
        self.text = text ?? ""
        self.image = image ?? ""
        self.order = order
        self.size = size
        self.fullWidth = fullWidth
        self.action = action ?? {}
    }
    let id: UUID
    let type: AlertComponentType
    let text: String
    let image: String
    let order: Int
    let size: CGFloat?
    let fullWidth: Bool
    let action: (() -> Void)
}

enum AlertComponentType {
    case Header, Body, Image, SystemImage, PositiveButton, NegativeButton
}
