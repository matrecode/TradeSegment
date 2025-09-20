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
    private let isSecure: Bool
    @Binding private var text: String
    @FocusState private var isFocused: Bool

    private var shouldPlaceHolderMove: Bool {
        isFocused || (text.count != 0)
    }

    public init(placeHolderText: String = "", text: Binding<String>, isSecure: Bool = false) {
        self.placeHolderText = placeHolderText
        self.isSecure = isSecure
        _text = text
    }
    var body: some View {
        ZStack(alignment: .leading) {
            HStack {
                if isSecure {
                    SecureField(
                        (isFocused || !text.isEmpty) ? "" : placeHolderText,
                        text: $text
                    )
                    .focused($isFocused)
                    .font(.system(size: 18))
                    .foregroundStyle(Color.black)
                    .animation(Animation.easeInOut(duration: 0.1), value: EdgeInsets())
                    .frame(alignment: .leading)
                } else {
                    TextField(
                        (isFocused || !text.isEmpty) ? "" : placeHolderText,
                        text: $text
                    )
                    .focused($isFocused)
                    .font(.system(size: 18))
                    .foregroundStyle(Color.black)
                    .animation(Animation.easeInOut(duration: 0.4), value: EdgeInsets())
                    .frame(alignment: .leading)
                }
            }
            .padding()
            .clipShape(RoundedRectangle(cornerRadius: 2))
            .overlay {
                RoundedRectangle(cornerRadius: 2)
                    .stroke(.secondary, lineWidth: 1)
            }

            Text(shouldPlaceHolderMove ? " " + placeHolderText + " " : "")
                .foregroundColor(Color.secondary)
                .scaleEffect(shouldPlaceHolderMove ? 1.0 : 1.2)
                .animation(Animation.easeInOut(duration: 0.4), value: shouldPlaceHolderMove)
                .background(Color(UIColor.systemBackground))
                .padding(shouldPlaceHolderMove ?
                         EdgeInsets(top: 0, leading: 15, bottom: textFieldHeight, trailing: 0) :
                            EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        FloatingTextField(placeHolderText: "Enter your name", text: .constant(""))
        FloatingTextField(placeHolderText: "Password", text: .constant(""), isSecure: true)
    }
}
