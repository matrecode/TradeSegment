//
//  WatchlistViewModel.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 29/09/25.
//

import Foundation
import SwiftUI
import Combine

final class WatchlistViewModel: WatchlistProtocol {
    typealias Coordinator = WatchlistCoordinator
    
    private let coordinator: Coordinator?
    
    @Published var navigationRoute: WatchlistRoute?
    @Published var searchText: String = ""
    @Published var watchlistData: [WatchlistModel] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init(coordinator: Coordinator? = nil) {
        self.coordinator = coordinator
    }
    
    func nextView(for route: WatchlistRoute) -> some View {
        coordinator?.view(for: route)
    }
    
    private func createMockData() -> [WatchlistModel] {
        return [
            WatchlistModel(symbolName: "RELIANCE", price: 1370.00, change: 6.00, sector: "Diversified"),
            WatchlistModel(symbolName: "HDFCBANK", price: 965.80, change: 14.80, sector: "Banking"),
            WatchlistModel(symbolName: "BHARTIARTL", price: 1869.50, change: -8.90, sector: "Telecom"),
            WatchlistModel(symbolName: "TCS", price: 2915.10, change: 26.70, sector: "IT Services"),
            WatchlistModel(symbolName: "ICICIBANK", price: 1372.00, change: 24.00, sector: "Banking"),
            WatchlistModel(symbolName: "SBIN", price: 865.15, change: -7.30, sector: "Banking"),
            WatchlistModel(symbolName: "BAJFINANCE", price: 987.35, change: -11.55, sector: "Financial Services"),
            WatchlistModel(symbolName: "INFY", price: 1447.90, change: 6.10, sector: "IT Services"),
            WatchlistModel(symbolName: "HINDUNILVR", price: 2535.00, change: 20.60, sector: "FMCG"),
            WatchlistModel(symbolName: "MARUTI", price: 15970.00, change: -59.00, sector: "Automotive"),
            WatchlistModel(symbolName: "LT", price: 3685.00, change: 26.00, sector: "Infrastructure"),
            WatchlistModel(symbolName: "ITC", price: 404.90, change: 3.35, sector: "FMCG"),
            WatchlistModel(symbolName: "M&M", price: 3468.50, change: 41.50, sector: "Automotive"),
            WatchlistModel(symbolName: "KOTAKBANK", price: 2067.70, change: 75.00, sector: "Banking"),
            WatchlistModel(symbolName: "SUNPHARMA", price: 1639.00, change: 44.70, sector: "Pharmaceuticals"),
            WatchlistModel(symbolName: "HCLTECH", price: 1391.00, change: 5.90, sector: "IT Services"),
            WatchlistModel(symbolName: "ULTRACEMCO", price: 12125.00, change: -97.00, sector: "Cement"),
            WatchlistModel(symbolName: "ASIANPAINT", price: 2339.70, change: -10.30, sector: "FMCG"),
            WatchlistModel(symbolName: "AXISBANK", price: 1161.40, change: 29.80, sector: "Banking"),
            WatchlistModel(symbolName: "BAJAJ-AUTO", price: 8616.00, change: -62.50, sector: "Automotive"),
            WatchlistModel(symbolName: "BEL", price: 407.05, change: 3.10, sector: "Defense"),
            WatchlistModel(symbolName: "CIPLA", price: 1511.60, change: 8.30, sector: "Pharmaceuticals"),
            WatchlistModel(symbolName: "DRREDDY", price: 1248.20, change: 24.50, sector: "Pharmaceuticals"),
            WatchlistModel(symbolName: "ONGC", price: 243.20, change: 3.70, sector: "Oil & Gas"),
            WatchlistModel(symbolName: "TATASTEEL", price: 167.56, change: -1.21, sector: "Metals"),
            WatchlistModel(symbolName: "TECHM", price: 1418.00, change: 17.70, sector: "IT Services"),
            WatchlistModel(symbolName: "TITAN", price: 3404.80, change: 37.80, sector: "Consumer Durables")
        ]
    }
    
    func getWatchlistData() {
        Just(createMockData())
            .delay(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .sink{ [weak self] watchlistItem in
                guard let self = self else { return }
                self.watchlistData = watchlistItem
            }
            .store(in: &cancellables)
    }
}
