//
//  WatchlistViewModel.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 29/09/25.
//

import Foundation
import SwiftUI

final class WatchlistViewModel: WatchlistProtocol {
    typealias Coordinator = WatchlistCoordinator
    
    private let coordinator: Coordinator?
    
    @Published var navigationRoute: WatchlistRoute?
    
    init(coordinator: Coordinator? = nil) {
        self.coordinator = coordinator
    }
    
    func nextView(for route: WatchlistRoute) -> some View {
        coordinator?.view(for: route)
    }
}
