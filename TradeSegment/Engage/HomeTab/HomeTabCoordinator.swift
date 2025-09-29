//
//  HomeTabCoordinator.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 29/09/25.
//
import Foundation
import SwiftUI

class HomeTabCoordinator {
    
}

extension HomeTabCoordinator {
    @ViewBuilder
    func view(route: HomeTabRoute) -> some View {
        switch route {
            case .watchlist:
                WatchlistCoordinator().view(for: .navigateToRoot)
            case .orders:
                Text("Orders")
            case .portfolio:
                Text("Portfolio")
            case .bids:
                Text("Bids")
            case .profile:
                Text("Profile")
        }
    }
}
