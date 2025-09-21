//
//  TradeSegmentApp.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 14/09/25.
//


// Import AppCoordinator and AppRootView
import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct TradeSegmentApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var appCoordinator = AppCoordinator()
    
    var body: some Scene {
        WindowGroup {
            let homeCoordinator = HomeCoordinator()
            if #available(iOS 16.0, *) {
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
            } else {
                NavigationView {
                    HomeView(viewModel: HomeViewModel(coordinator: homeCoordinator))
                        .environmentObject(appCoordinator)
                }
            }
        }
    }
}
