//
//  ProfileProtocol.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 29/09/25.
//
import Foundation
import SwiftUI

protocol ProfileProtocol: ObservableObject {
    associatedtype Body: View
    
    var navigationRoute: ProfileRoute? { get set }
    func nextView(for route: ProfileRoute) -> Body
}
