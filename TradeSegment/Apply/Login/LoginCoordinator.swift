//
//  LoginCoordinator.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 20/09/25.
//

import Foundation
import SwiftUI

final class LoginCoordinator {}

extension LoginCoordinator {
    @ViewBuilder
    func view(for route: LoginRoute) -> some View {
        switch route {
            case .navigateToRoot:
                LoginView()
            case .navigateToOTP:
                EmptyView()
        }
    }
}
