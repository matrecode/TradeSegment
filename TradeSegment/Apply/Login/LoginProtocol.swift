//
//  LoginProtocol.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 20/09/25.
//

import Foundation
import SwiftUI

protocol LoginProtocol: ObservableObject {
    associatedtype Body: View
    
    var navigationRoute: LoginRoute? { get set }
    func doLogin()
    func nextView(for route: LoginRoute) -> Body
}
