//
//  HomeTabProtocol.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 25/09/25.
//

import Foundation
import SwiftUI

protocol HomeTabProtocol: ObservableObject {
    associatedtype Body: View
    
    var navigationRoute: HomeTabRoute? { get }
    func nextView(route: HomeTabRoute) -> Body
}
