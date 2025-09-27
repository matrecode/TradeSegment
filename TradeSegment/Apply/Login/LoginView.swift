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
                        placeHolderText: "Email Address",
                        text: $viewModel.email,
                        label: "Email Address"
                    )
                    FloatingTextField(
                        placeHolderText: "Password",
                        text: $viewModel.password,
                        isSecure: true,
                        label: "Password"
                    )
                    if let loginResult = viewModel.loginResult{
                        switch loginResult {
                            case .success:
                                Text("Login successful!")
                                    .foregroundColor(.green)
                                    .font(.caption)
                            case .failure(let loginError):
                                Text(loginError.description)
                                    .foregroundColor(.red)
                                    .font(.caption)
                        }
                    }
                    PrimaryButton(title: viewModel.isLoading ? "Loading..." : "Login", action: {
                        viewModel.doLogin()
                    })
                }
                desclaimerView
            }
            .frame(
                maxWidth: .infinity,
                alignment: .center
            )
            .padding([.leading, .trailing], 24.0)
            .navigate(item: $viewModel.navigationRoute){
                viewModel.nextView(for: $0)
            }
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
