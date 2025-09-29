//
//  HomeTabViewModel.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 25/09/25.
//

import Foundation
import SwiftUI

class HomeTabViewModel: HomeTabProtocol {
    typealias Coordinator = HomeTabCoordinator
    
    @Published var navigationRoute: HomeTabRoute?
    private let coordinator: Coordinator?
    
    init(coordinator: Coordinator? = nil) {
        self.coordinator = coordinator
    }
    
    func nextView(route: HomeTabRoute) -> some View {
        coordinator?.view(route: route)
    }
}
