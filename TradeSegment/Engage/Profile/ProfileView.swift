//
//  ProfileView.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 29/09/25.
//

import SwiftUI
import Combine

struct ProfileView<ViewModel: ProfileProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        Text("Profile")
    }
}

#Preview {
    ProfileView(viewModel: ProfileViewModel())
}
