//
//  WatchlistProtocol.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 29/09/25.
//
import Foundation
import SwiftUI

protocol WatchlistProtocol: ObservableObject {
    associatedtype Body: View
    
    var navigationRoute: WatchlistRoute? { get set }
    func nextView(for route: WatchlistRoute) -> Body
}
