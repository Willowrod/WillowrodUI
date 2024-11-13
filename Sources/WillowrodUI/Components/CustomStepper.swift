//
//  CustomStepper.swift
//  Fighting Fantasy Tracker
//
//  Created by Mike Hall on 07/10/2024.
//

import SwiftUI

//public struct CustomStepper: View {
//    public init(count: Int32, action: ( (Int32) -> Void)? = nil) {
//        self.count = count
//        self.action = action
//    }
//
//    @Binding var count: Int32
//
//    var action: ((Int32) -> Void)? = nil
//    public var body: some View {
//        HStack(spacing: 10){
//            Image(systemName:"minus.circle").tappable({
//                if count > 0 {
//                    count -= 1
//                }
//                if let action {
//                    action(count)
//                }
//            })
//
//            ZStack{
//                SecondaryText( "\(count)", size: 18, colour: Color.black)
//            }.frame(width: 50, height: 30).background(Color.white).border(Color.gray)
//
//            Image(systemName:"plus.circle").tappable({
//                        count += 1
//                    if let action {
//                        action(count)
//                    }
//                })
//        }
//    }
//}

//#Preview {
//    var count: Int32 = 0
//    return CustomStepper(count: $count){_ in }
//}
