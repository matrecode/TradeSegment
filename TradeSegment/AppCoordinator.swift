//  AppCoordinator.swift
//  TradeSegment
//
//  Centralized coordinator for app-wide navigation and refresh logic.
//

import Foundation
import SwiftUI

final class AppCoordinator: ObservableObject {
    // Navigation stack for root-level navigation
    @Published var navigationStack: [AppRootView] = []
    
    // Example: API refresh trigger
    @Published var shouldRefresh: Bool = false

    // Navigate to a new root view
    func navigate(to root: AppRootView) {
        navigationStack.append(root)
    }

    // Pop to root and trigger refresh
    func popToRootAndRefresh() {
        navigationStack = [.home]
        shouldRefresh.toggle() // Observers can reload APIs when this changes
    }

    // Pop to any screen and optionally refresh
    func popTo(screen: AppRootView, refresh: Bool = false) {
        if let idx = navigationStack.firstIndex(of: screen) {
            navigationStack = Array(navigationStack.prefix(upTo: idx + 1))
            if refresh {
                shouldRefresh.toggle()
            }
        }
    }
}

// Enum for root navigation
enum AppRootView: Equatable {
    case home
    // Add other root views as needed
}
