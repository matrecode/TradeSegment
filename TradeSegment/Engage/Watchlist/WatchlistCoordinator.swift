//
//  WatchlistCoordinator.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 29/09/25.
//

import Foundation
import SwiftUI

class WatchlistCoordinator {
    
}

extension WatchlistCoordinator {
    @ViewBuilder
    func view(for route: WatchlistRoute) -> some View {
        switch route {
            case .navigateToRoot:
                let viewModel = WatchlistViewModel(coordinator: self)
                WatchlistView(viewModel: viewModel)
            case .didSelectNext:
                EmptyView()
        }
    }
}
