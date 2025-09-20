//
//  LoginViewModel.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 20/09/25.
//

import Foundation
import SwiftUI

final class LoginViewModel: LoginProtocol {
    typealias Coordinator = LoginCoordinator
    
    var navigationRoute: LoginRoute?
    let coordinator: Coordinator?
    
    init(coordinator: Coordinator? = nil) {
        self.coordinator = coordinator
    }
    
    func nextView(for route: LoginRoute) -> some View {
        coordinator?.view(for: route)
    }
}
