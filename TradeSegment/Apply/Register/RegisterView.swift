//
//  RegisterView.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 18/09/25.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject var viewModel: RegisterViewModel
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
                    
                    if let registrationResult = viewModel.registrationResult{
                        switch registrationResult {
                            case .success:
                                Text("Registration successful!")
                                    .foregroundColor(.green)
                                    .font(.caption)
                            case .failure(let error):
                                Text(error.description)
                                    .foregroundColor(.red)
                                    .font(.caption)
                        }
                    }
                    
                    PrimaryButton(title: viewModel.isLoading ? "Loading..." : "Register", action: {
                        viewModel.register()
                    })
                    .disabled(viewModel.isLoading)
                    subtitleView
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
        .navigate(item: $viewModel.navigationRoute){
            viewModel.nextView(for: $0)
        }
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
    
    private var subtitleView: some View {
        Text(viewModel.termsAndConditionText)
            .font(.caption)
            .foregroundStyle(.secondary)
    }
    
    private var desclaimerView : some View {
        DesclaimerView()
    }
}

#Preview {
    if #available(iOS 16.0, *) {
        NavigationStack {
            RegisterView(viewModel: RegisterViewModel())
        }
    } else {
        NavigationView {
            RegisterView(viewModel: RegisterViewModel())
        }
    }
}
