//
//  StockItem.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 02/10/25.
//

import SwiftUI

struct StockItem: View {
    let name: String
    let price: Double
    let change: Double
    let sector: String
    
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 6){
                Text(name)
                    .font(.caption)
                    .textCase(.uppercase)
                Text("\(sector)")
                    .font(.caption)
                    .foregroundStyle(Color.gray)
                    .textCase(.uppercase)
            }
            Spacer()
            VStack(alignment: .leading, spacing: 6){
                Text("\(price, specifier: "%.2f")")
                    .font(.caption)
                Text("\(change, specifier: "%.2f")")
                    .font(.caption)
                    .foregroundStyle(change > 0 ? Color.green : Color.red)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    StockItem(name: "HINDALCO", price: 270, change: 17, sector: "NSE")
}
