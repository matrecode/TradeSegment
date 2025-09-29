//
//  WatchlistView.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 29/09/25.
//

import SwiftUI
import Combine

struct WatchlistView<ViewModel: WatchlistProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        Text("Watchlist")
    }
}

#Preview {
    WatchlistView(viewModel: WatchlistViewModel())
}
