//
//  UIApplication+Extension.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 19/09/25.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension View {
    func hideKeyboardOnTap() -> some View {
        self.gesture(
            TapGesture().onEnded { _ in
                UIApplication.shared.endEditing()
            }
        )
    }
}
