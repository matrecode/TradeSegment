//
//  HomeTabView.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 25/09/25.
//

import SwiftUI

struct HomeTabView: View {
    @State private var selectedTab = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("First Tab")
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            Text("Second Tab")
                .tabItem {
                    Image(systemName: "cart")
                    Text("Cart")
                }
        }
    }
}

#Preview {
    HomeTabView()
}
