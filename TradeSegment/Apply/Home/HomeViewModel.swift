//
//  HomeViewModel.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 16/09/25.
//

import Foundation
import SwiftUI

final class HomeViewModel: HomeProtocol {

    typealias Coordinator = HomeCoordinator
    
    @Published var nextNavigationRoute: HomeRoutes?
    
    private let coordinator: Coordinator?
    
    init(coordinator: Coordinator? = nil) {
        self.coordinator = coordinator
    }
    
    @ViewBuilder
    func nextView(for route: HomeRoutes) -> some View {
        self.coordinator?.view(for: route)
    }
}
