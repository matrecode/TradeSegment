//
//  FloatingTextField.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 19/09/25.
//

import SwiftUI

struct FloatingTextField: View {
    private let textFieldHeight: CGFloat = 50
    private let placeHolderText: String
    private var label: String
    private let isSecure: Bool
    @Binding private var text: String
    @FocusState private var isFocused: Bool

    public init(placeHolderText: String = "", text: Binding<String>, isSecure: Bool = false, label: String) {
        self.placeHolderText = placeHolderText
        self.isSecure = isSecure
        _text = text
        self.label = label
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(label)
                .font(.subheadline)
                .foregroundStyle(Color.black)
            HStack {
                if isSecure {
                    SecureField(
                        (isFocused || !text.isEmpty) ? "" : placeHolderText,
                        text: $text
                    )
                    .autocapitalization(.none)
                    .focused($isFocused)
                    .font(.system(size: 18))
                    .foregroundStyle(Color.black)
                    .frame(alignment: .leading)
                } else {
                    TextField(
                        (isFocused || !text.isEmpty) ? "" : placeHolderText,
                        text: $text
                    )
                    .autocapitalization(.none)
                    .focused($isFocused)
                    .font(.system(size: 18))
                    .foregroundStyle(Color.black)
                    .frame(alignment: .leading)
                }
            }
            .padding()
            .clipShape(RoundedRectangle(cornerRadius: 2))
            .overlay {
                RoundedRectangle(cornerRadius: 2)
                    .stroke(.secondary, lineWidth: 1)
            }
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        FloatingTextField(
            placeHolderText: "Enter your name",
            text: .constant(""),
            label: "Name"
        )
        FloatingTextField(
            placeHolderText: "Password",
            text: .constant(""),
            isSecure: true,
            label: "Password"
        )
    }
}
