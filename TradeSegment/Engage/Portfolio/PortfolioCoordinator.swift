//
//  PortfolioCoordinator.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 29/09/25.
//

import Foundation
import SwiftUI

class PortfolioCoordinator {
    
}

extension PortfolioCoordinator {
    @ViewBuilder
    func view(for route: PortfolioRoute) -> some View {
        switch route {
            case .navigateToRoot:
                let viewModel = PortfolioViewModel(coordinator: self)
                PortfolioView(viewModel: viewModel)
            case .didSelectNext:
                EmptyView()
        }
    }
}
