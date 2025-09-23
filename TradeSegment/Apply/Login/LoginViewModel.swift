//
//  LoginViewModel.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 20/09/25.
//

import Foundation
import SwiftUI
import FirebaseAuth

final class LoginViewModel: LoginProtocol {
    typealias Coordinator = LoginCoordinator
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var loginResult: AuthResult? = nil
    @Published var isLoading: Bool = false
    
    var navigationRoute: LoginRoute?
    let coordinator: Coordinator?
    
    init(coordinator: Coordinator? = nil) {
        self.coordinator = coordinator
    }
    
    func doLogin() {
        isLoading = true
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.isLoading = false
                if let error = error as NSError? {
                    let code = AuthErrorCode(rawValue: error.code)
                    let authError: AuthError
                    switch code {
                        case .emailAlreadyInUse:
                            authError = .emailAlreadyInUse
                        case .invalidEmail:
                            authError = .invalidEmail
                        case .weakPassword:
                            authError = .weakPassword
                        case .networkError:
                            authError = .networkError
                        default:
                            authError = .unknown(error.localizedDescription)
                    }
                    self.loginResult = .failure(authError)
                } else {
                    self.loginResult = .success
                }
            }
        }
    }
    
    func nextView(for route: LoginRoute) -> some View {
        coordinator?.view(for: route)
    }
}
