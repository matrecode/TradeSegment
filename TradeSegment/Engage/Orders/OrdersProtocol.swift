//
//  OrdersProtocol.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 29/09/25.
//
import Foundation
import SwiftUI

protocol OrdersProtocol: ObservableObject {
    associatedtype Body: View
    
    var navigationRoute: OrdersRoute? { get set }
    func nextView(for route: OrdersRoute) -> Body
}
