//
//  OrdersCoordinator.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 29/09/25.
//

import Foundation
import SwiftUI

class OrdersCoordinator {
    
}

extension OrdersCoordinator {
    @ViewBuilder
    func view(for route: OrdersRoute) -> some View {
        switch route {
            case .navigateToRoot:
                let viewModel = OrdersViewModel(coordinator: self)
                OrdersView(viewModel: viewModel)
            case .didSelectNext:
                EmptyView()
        }
    }
}
