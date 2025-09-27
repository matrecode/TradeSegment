//
//  RegisterViewModel.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 19/09/25.
//

import Foundation
import SwiftUI
import FirebaseAuth

final class RegisterViewModel: RegisterProtocol {
    typealias Coordinator = RegisterCoordinator
    
    @Published var navigationRoute: RegisterRoute?
    private let coordinator: Coordinator?
    
    // Registration state
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var registrationResult: AuthResult? = nil
    @Published var isLoading: Bool = false
    
    // MARK - Computed Property
    
    var termsAndConditionText: AttributedString {
        var attributedText = AttributedString("terms and conditions")
        attributedText.underlineStyle = .single
        if let url = URL(string: "https://www.google.com") {
            attributedText.link = url
        }
        return "By continuing you agree to our" + " " + attributedText
    }
    
    init(coordinator: Coordinator? = nil){
        self.coordinator = coordinator
    }
    
    func register() {
        self.registrationResult = nil
        self.isLoading = true
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                if let error = error as NSError? {
                    let code = AuthErrorCode(rawValue: error.code)
                    let registerError: AuthError
                    switch code {
                        case .emailAlreadyInUse:
                            registerError = .emailAlreadyInUse
                        case .invalidEmail:
                            registerError = .invalidEmail
                        case .weakPassword:
                            registerError = .weakPassword
                        case .networkError:
                            registerError = .networkError
                        default:
                            registerError = .unknown(error.localizedDescription)
                    }
                    self?.registrationResult = .failure(registerError)
                    return
                }
                self?.registrationResult = .success
                self?.email = ""
                self?.password = ""
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self?.navigationRoute = .navigateToLogin
                }
            }
        }
    }
    
    func nextView(for route: RegisterRoute) -> some View {
        coordinator?.view(for: route)
    }
}
