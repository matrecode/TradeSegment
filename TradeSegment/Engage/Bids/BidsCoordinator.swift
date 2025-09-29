//
//  BidsCoordinator.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 29/09/25.
//

import Foundation
import SwiftUI

class BidsCoordinator {
    
}

extension BidsCoordinator {
    @ViewBuilder
    func view(for route: BidsRoute) -> some View {
        switch route {
            case .navigateToRoot:
                let viewModel = BidsViewModel(coordinator: self)
                BidsView(viewModel: viewModel)
            case .didSelectNext:
                EmptyView()
        }
    }
}
