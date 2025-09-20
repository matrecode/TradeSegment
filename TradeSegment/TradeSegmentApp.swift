//
//  TradeSegmentApp.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 14/09/25.
//


// Import AppCoordinator and AppRootView
import SwiftUI

@main
struct TradeSegmentApp: App {

    @StateObject private var appCoordinator = AppCoordinator()

    var body: some Scene {
        WindowGroup {
            let homeCoordinator = HomeCoordinator()
            NavigationStack(path: $appCoordinator.navigationStack) {
                HomeView(viewModel: HomeViewModel(coordinator: homeCoordinator))
                    .environmentObject(appCoordinator)
                    .navigationDestination(for: AppRootView.self) { root in
                        switch root {
                        case .home:
                            HomeView(viewModel: HomeViewModel(coordinator: homeCoordinator))
                                .environmentObject(appCoordinator)
                        }
                    }
            }
        }
    }
}
