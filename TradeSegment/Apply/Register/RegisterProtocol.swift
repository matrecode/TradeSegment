//
//  RegisterProtocol.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 19/09/25.
//

import Foundation
import SwiftUI

protocol RegisterProtocol: ObservableObject {
    associatedtype Body: View
    
    var navigationRoute: RegisterRoute? { get set }
    func register()
    func nextView(for route: RegisterRoute) -> Body
}
