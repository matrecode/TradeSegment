//
//  ProfileViewModel.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 29/09/25.
//

import Foundation
import SwiftUI

final class ProfileViewModel: ProfileProtocol {
    typealias Coordinator = ProfileCoordinator
    
    private let coordinator: Coordinator?
    
    @Published var navigationRoute: ProfileRoute?
    
    init(coordinator: Coordinator? = nil) {
        self.coordinator = coordinator
    }
    
    func nextView(for route: ProfileRoute) -> some View {
        coordinator?.view(for: route)
    }
}
