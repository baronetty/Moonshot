//
//  Rectangle.swift
//  Moonshot
//
//  Created by Leo  on 26.11.23.
//

import SwiftUI

struct RectangleDivider: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(height: 1)
            .foregroundStyle(.lightBackground)
//            .padding()
    }
}

extension View {
    func rectangleDivider () -> some View {
        modifier(RectangleDivider())
    }
}

#Preview {
    Rectangle()
}
