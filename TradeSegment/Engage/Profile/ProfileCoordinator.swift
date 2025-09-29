//
//  ProfileCoordinator.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 29/09/25.
//

import Foundation
import SwiftUI

class ProfileCoordinator {
    
}

extension ProfileCoordinator {
    @ViewBuilder
    func view(for route: ProfileRoute) -> some View {
        switch route {
            case .navigateToRoot:
                let viewModel = ProfileViewModel(coordinator: self)
                ProfileView(viewModel: viewModel)
            case .didSelectNext:
                EmptyView()
        }
    }
}
