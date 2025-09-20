//
//  RegisterCoordinator.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 19/09/25.
//

import Foundation
import SwiftUI

final class RegisterCoordinator {}

extension RegisterCoordinator {
    @ViewBuilder
    func view(for route: RegisterRoute) -> some View {
        switch route {
            case .navigateToRoot:
                RegisterView()
            case .navigateToOtpVerification:
                EmptyView()
        }
    }
}
