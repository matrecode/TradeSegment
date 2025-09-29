//
//  OrdersView.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 29/09/25.
//

import SwiftUI
import Combine

struct OrdersView<ViewModel: OrdersProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        Text("Orders")
    }
}

#Preview {
    OrdersView(viewModel: OrdersViewModel())
}
