//
//  RegisterRoute.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 19/09/25.
//

import Foundation

enum RegisterRoute: Identifiable {
    var id: Self { self }
    case navigateToRoot
    case navigateToOtpVerification
}
