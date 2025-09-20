//
//  HomeCoordinator.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 17/09/25.
//

import Foundation
import SwiftUI

final class HomeCoordinator { }

extension HomeCoordinator {
    @ViewBuilder
    func view(for route: HomeRoutes) -> some View {
        switch route {
            case .navigateToRoot:
                let viewModel = HomeViewModel()
                HomeView(viewModel: viewModel)
            case .navigateToLogin:
                LoginCoordinator().view(for: .navigateToRoot)
            case .navigateToRegister:
                RegisterCoordinator().view(for: .navigateToRoot)
        }
    }
}
