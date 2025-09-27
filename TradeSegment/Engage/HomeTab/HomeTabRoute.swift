//
//  HomeTabRoute.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 25/09/25.
//

import Foundation

public enum HomeTabRoute: Identifiable {
    public var id: Self { self }
    case watchlist
    case orders
    case portfolio
    case bids
    case profile
}
