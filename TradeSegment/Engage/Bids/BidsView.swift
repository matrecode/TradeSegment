//
//  BidsView.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 29/09/25.
//

import SwiftUI
import Combine

struct BidsView<ViewModel: BidsProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        Text("Bids")
    }
}

#Preview {
    BidsView(viewModel: BidsViewModel())
}
