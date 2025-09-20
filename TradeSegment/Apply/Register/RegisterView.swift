//
//  RegisterView.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 18/09/25.
//

import SwiftUI

struct RegisterView: View {
    @State var name: String = ""
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 64.0) {
                titleView
                imageView
                VStack(spacing: 20.0) {
                    FloatingTextField(placeHolderText: "Phone number", text: $name)
                    PrimaryButton(title: "Continue", action: {
                        print("Register")
                    })
                }
                desclaimerView
            }
            .frame(
                maxWidth: .infinity,
                alignment: .center
            )
            .padding([.leading, .trailing], 24.0)
        }
        .hideKeyboardOnTap()
    }
    
    
    
    private var titleView: some View {
        Text("Open your account")
            .font(.title2)
            .fontWeight(.bold)
            .padding(.top, 48.0)
    }
    
    private var imageView: some View {
        VStack {
            Image("otp")
                .resizable()
                .frame(width: 160, height: 160)
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
    
    private var desclaimerView : some View {
        DesclaimerView()
    }
}

#Preview {
    RegisterView()
}
