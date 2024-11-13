//
//  SwiftUIView.swift
//  Fighting Fantasy Tracker
//
//  Created by Mike Hall on 07/10/2024.
//

import SwiftUI

/**
 * Badge
 *
 * Provides a notification badge with value inside
 *
 */

public struct Badge: View {
    init(count: Int) {
        self.count = count
    }
    let count: Int
    public var body: some View {
        HStack {
            let text = count > 99 ? "99+" : String(count)

            HeaderText( text, size: 8, colour: Color.white)
                .frame(width: 18, height: 18).background(Color.red).cornerRadius(9)
        }.frame(maxWidth: 40, maxHeight: .infinity, alignment: .center)
    }
}

#Preview {
    HStack{
        Badge(count: 8)
        Badge(count: 88)
        Badge(count: 888)
    }
}
