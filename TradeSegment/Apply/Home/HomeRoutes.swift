//
//  HomeRoutes.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 16/09/25.
//

import Foundation

enum HomeRoutes: Identifiable {
    var id: Self { self }
    case navigateToRoot
    case navigateToLogin
    case navigateToRegister
}
