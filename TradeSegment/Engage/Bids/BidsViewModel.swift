//
//  BidsViewModel.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 29/09/25.
//

import Foundation
import SwiftUI

final class BidsViewModel: BidsProtocol {
    typealias Coordinator = BidsCoordinator
    
    private let coordinator: Coordinator?
    
    @Published var navigationRoute: BidsRoute?
    
    init(coordinator: Coordinator? = nil) {
        self.coordinator = coordinator
    }
    
    func nextView(for route: BidsRoute) -> some View {
        coordinator?.view(for: route)
    }
}
