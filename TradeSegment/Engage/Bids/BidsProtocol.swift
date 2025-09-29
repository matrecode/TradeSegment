//
//  BidsProtocol.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 29/09/25.
//
import Foundation
import SwiftUI

protocol BidsProtocol: ObservableObject {
    associatedtype Body: View
    
    var navigationRoute: BidsRoute? { get set }
    func nextView(for route: BidsRoute) -> Body
}
