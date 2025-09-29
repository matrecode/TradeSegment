//
//  PortfolioView.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 29/09/25.
//

import SwiftUI
import Combine

struct PortfolioView<ViewModel: PortfolioProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        Text("Portfolio")
    }
}

#Preview {
    PortfolioView(viewModel: PortfolioViewModel())
}
