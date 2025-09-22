//
//  LoginView.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 20/09/25.
//

import Foundation
import SwiftUI

struct LoginView: View {
    @State var mobileNumber: String = ""
    @State var password: String = ""
    @ObservedObject var viewModel: LoginViewModel
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 64.0) {
                titleView
                VStack(spacing: 20.0) {
                    FloatingTextField(
                        placeHolderText: "Phone number",
                        text: $mobileNumber
                    )
                    FloatingTextField(
                        placeHolderText: "Password",
                        text: $password,
                        isSecure: true
                    )
                    PrimaryButton(title: "Login", action: {
                        
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
        Text("Login")
            .font(.title2)
            .fontWeight(.bold)
            .padding(.top, 48.0)
    }
    
    private var desclaimerView : some View {
        DesclaimerView()
    }
}

#Preview {
    LoginView(viewModel: LoginViewModel())
}
