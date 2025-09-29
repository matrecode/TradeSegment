//
//  OrdersViewModel.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 29/09/25.
//

import Foundation
import SwiftUI

final class OrdersViewModel: OrdersProtocol {
    typealias Coordinator = OrdersCoordinator
    
    private let coordinator: Coordinator?
    
    @Published var navigationRoute: OrdersRoute?
    
    init(coordinator: Coordinator? = nil) {
        self.coordinator = coordinator
    }
    
    func nextView(for route: OrdersRoute) -> some View {
        coordinator?.view(for: route)
    }
}
