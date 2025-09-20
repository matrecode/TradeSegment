//
//  RegisterViewModel.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 19/09/25.
//

import Foundation
import SwiftUI

final class RegisterViewModel: RegisterProtocol {
    typealias Coordinator = RegisterCoordinator
    
    @Published var navigationRoute: RegisterRoute?
    private let coordinator: Coordinator?
    
    init(coordinator: Coordinator? = nil){
        self.coordinator = coordinator
    }
    
    func nextView(for route: RegisterRoute) -> some View {
        coordinator?.view(for: route)
    }
}
