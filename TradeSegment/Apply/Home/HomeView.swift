//
//  HomeView.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 15/09/25.
//

import SwiftUI


struct HomeView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    @StateObject var viewModel: HomeViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 64.0){
            logoView
            titleView
            listView
            bottomView
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .leading
        )
        .padding([.leading, .trailing], 24.0)
        .navigationDestination(item: $viewModel.nextNavigationRoute){
            viewModel.nextView(for: $0)
        }
    }
    
    private var logoView: some View {
        Image("logo")
            .resizable()
            .frame(width: 64, height: 64)
    }
    
    private var titleView: some View {
        Text("Welcome to Trite by TRADE SEGMENT")
            .font(.largeTitle)
            .fontWeight(.bold)
    }
    
    private var listView: some View {
        VStack(alignment: .leading) {
            Divider()
            Button(action: {
                viewModel.nextNavigationRoute = .navigateToRegister
            }) {
                ListItem(title: "Open a free account", image: "person")
            }
            Divider()
            Button(action: {
                viewModel.nextNavigationRoute = .navigateToLogin
            }) {
                ListItem(title: "Login to Trite", image: "rectangle.portrait.and.arrow.forward")
            }
            Divider()
        }
        .foregroundColor(Color.black)
    }
    
    private var bottomView: some View {
        DesclaimerView()
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
