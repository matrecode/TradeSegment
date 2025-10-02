//
//  HomeTabView.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 25/09/25.
//

import SwiftUI

struct HomeTabView<ViewModel: HomeTabProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    @State private var selectedTab = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            nextView(route: .watchlist)
                .tabItem {
                    Label("Watchlist", systemImage: "bookmark")
                }
                .tag(0)
            nextView(route: .orders)
                .tabItem {
                    Label("Orders", systemImage: "book")
                }
                .tag(1)
            nextView(route: .portfolio)
                .tabItem {
                    Label("Portfolio", systemImage: "briefcase")
                }
                .tag(2)
            nextView(route: .bids)
                .tabItem {
                    Label("Bids", systemImage: "hammer")
                }
                .tag(3)
            nextView(route: .profile)
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
                .tag(4)
        }
    }
    
    @ViewBuilder
    private func nextView(route: HomeTabRoute) -> some View {
        VStack(spacing: 0) {
            viewModel.nextView(route: route)
        }
    }
}

#Preview {
    HomeTabView(viewModel: HomeTabViewModel())
}
