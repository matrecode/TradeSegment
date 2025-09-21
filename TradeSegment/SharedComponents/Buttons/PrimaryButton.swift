//
//  PrimaryButton.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 20/09/25.
//

import Foundation
import SwiftUI

struct PrimaryButton: View {
    let title: String
    let action: () -> Void
    @GestureState private var isPressed = false

    var body: some View {
        Button(action: action) {
            Text(title)
                .frame(maxWidth: .infinity)
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .font(.headline)
                .clipShape(RoundedRectangle(cornerRadius: 2))
                .scaleEffect(isPressed ? 0.96 : 1.0)
                .opacity(isPressed ? 0.85 : 1.0)
                .animation(.easeInOut(duration: 0.12), value: isPressed)
        }
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .updating($isPressed) { _, state, _ in
                    state = true
                }
        )
    }
}

#Preview {
    PrimaryButton(title: "Press Me", action: { print("Pressed")})
}
