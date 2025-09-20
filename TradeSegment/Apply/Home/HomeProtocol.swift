//
//  HomeProtocol.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 16/09/25.
//

import Foundation
import SwiftUI

protocol HomeProtocol: ObservableObject {
    associatedtype Body: View
    
    var nextNavigationRoute: HomeRoutes? { get set }
    func nextView(for route: HomeRoutes) -> Body
}
