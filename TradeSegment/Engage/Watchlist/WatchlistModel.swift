//
//  WatchlistModel.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 02/10/25.
//

import Foundation

struct WatchlistModel: Identifiable, Codable {
    var id = UUID()
    let symbolName: String
    let price: Double
    let change: Double
    let sector: String
}
