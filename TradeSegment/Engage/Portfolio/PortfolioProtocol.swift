//
// PortfolioProtocol.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 29/09/25.
//
import Foundation
import SwiftUI

protocol PortfolioProtocol: ObservableObject {
    associatedtype Body: View
    
    var navigationRoute: PortfolioRoute? { get set }
    func nextView(for route: PortfolioRoute) -> Body
}
