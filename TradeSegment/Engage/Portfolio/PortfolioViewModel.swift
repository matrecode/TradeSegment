//
//  PortfolioViewModel.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 29/09/25.
//

import Foundation
import SwiftUI

final class PortfolioViewModel: PortfolioProtocol {
    typealias Coordinator = PortfolioCoordinator
    
    private let coordinator: Coordinator?
    
    @Published var navigationRoute: PortfolioRoute?
    
    init(coordinator: Coordinator? = nil) {
        self.coordinator = coordinator
    }
    
    func nextView(for route: PortfolioRoute) -> some View {
        coordinator?.view(for: route)
    }
    
    func test(){
       
    }
    
    func test(name:String){
       
    }
    

    
    
}
