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
    @State private var isExpanded = false
    
    var body: some View {
        ZStack {
            Color.gray
                .opacity(0.1)
                .edgesIgnoringSafeArea(.all)
            
            GeometryReader { geometry in
                VStack(spacing: 0) {
                    headerView
                        .frame(height: geometry.size.height * 0.085)
                    
                    if isExpanded {
                        expandedView
                            .frame(height: geometry.size.height * 0.14)
                    }
                    
                    VStack {
                        searchTextField
                        ScrollView(.vertical, showsIndicators: true){
                            VStack {
                                ForEach(viewModel.watchlistData){ stock in
                                    StockItem(
                                        name: stock.symbolName,
                                        price: stock.price,
                                        change: stock.change,
                                        sector: stock.sector
                                    )
                                    Divider()
                                }
                            }
                            .frame(maxWidth: .infinity)
                        }
                    }
                    .background(Color.white)
                    .clipShape(
                        UnevenRoundedRectangle(
                            cornerRadii: .init(
                                topLeading: 20,
                                topTrailing: 20
                            )
                        )
                    )
                    .toolbarBackground(.visible, for: .tabBar)
                    .toolbarBackground(Color.white, for: .tabBar)
                    .onAppear{
                        viewModel.getWatchlistData()
                    }
                }
            }
        }
    }
    
    private var headerView: some View {
        VStack {
            HStack{
                ScrollView(.horizontal, showsIndicators: false) {
                    if isExpanded {
                        Text("Overview")
                            .font(.title2)
                            .fontWeight(.semibold)
                    } else {
                        HStack {
                            createIndicesRow(
                                title: "Nifty 50",
                                price: "24836.30",
                                change: "+225.20",
                                changeInPercentage: "+0.91%"
                            )
                            Spacer()
                            createIndicesRow(
                                title: "Bank Nifty",
                                price: "55347.95",
                                change: "+712.20",
                                changeInPercentage: "+1.30%"
                            )
                        }
                    }
                }
                Spacer()
                Image(systemName: "arrow.down.and.line.horizontal.and.arrow.up")
                    .rotationEffect(.degrees(isExpanded ? 180 : 0))
                    .onTapGesture {
                        withAnimation(.spring()) {
                            isExpanded.toggle()
                        }
                    }
                    .padding(.leading, 16)
            }
            .padding()
        }
        .frame(maxWidth: .infinity)
        .background(Color.gray.opacity(0))
    }
    
    private var expandedView: some View {
        VStack {
            HStack {
                createIndicesCard(
                    title: "Nifty 50",
                    price: "24836.30",
                    change: "+225.20",
                    changeInPercentage: "+0.91%"
                )
                Spacer()
                createIndicesCard(
                    title: "Bank Nifty",
                    price: "55347.95",
                    change: "+712.20",
                    changeInPercentage: "+1.30%"
                )
                Spacer()
            }
            .padding()
        }
        .frame(maxWidth: .infinity)
        .background(Color.gray.opacity(0))
    }
    
    private var searchTextField: some View {
        VStack {
            HStack {
                TextField("Search", text: $viewModel.searchText)
                    .autocapitalization(.words)
                    .font(.caption)
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(Color.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 4))
            .overlay {
                RoundedRectangle(cornerRadius: 4)
                    .stroke(.secondary, lineWidth: 1)
                    .opacity(0)
            }
        }
        .padding()
    }
    
    private func createIndicesRow(title: String, price: String, change: String, changeInPercentage: String) -> some View {
        VStack(alignment: .leading, spacing: 5){
            Text(title)
                .font(.caption2)
                .textCase(.uppercase)
            HStack {
                Text(price)
                    .font(.caption2)
                    .foregroundStyle(Color.green)
                Text("\(change) (\(changeInPercentage))")
                    .font(.caption2)
                    .foregroundStyle(Color.gray)
            }
        }
    }
    
    private func createIndicesCard(title: String, price: String, change: String, changeInPercentage: String) -> some View {
        VStack(alignment: .leading, spacing: 10){
            Text(title)
                .font(.headline)
                .textCase(.uppercase)
            Text(price)
                .font(.subheadline)
            Text("\(change) (\(changeInPercentage))")
                .font(.caption2)
                .foregroundStyle(Color.green)
        }
    }
}

#Preview {
    WatchlistView(viewModel: WatchlistViewModel())
}
