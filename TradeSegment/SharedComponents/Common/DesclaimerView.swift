//
//  DesclaimerView.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 16/09/25.
//

import SwiftUI

struct DesclaimerView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12.0) {
            HStack {
                Image("logo")
                    .resizable()
                    .frame(width: 16, height: 16)
                
                Text("Trade Segment")
                    .fontWeight(.bold)
                    .foregroundStyle(.secondary)
                    .textCase(.uppercase)
            }
            
            Text(
                "NSE & BSE - SEBI Registration no.: INZ0000000000 | MCX - SEBI Registration no.: INZ0000000000 | CDSL - SEBI Registration no.: IN-DP-000-000) | \(Text("[Smart Online Dispute Resolution](https://akshaymatredev.netlify.app/)").underline()) | \(Text("[SEBI SCORES](https://akshaymatredev.netlify.app/)").underline())"
            )
            .font(.caption)
            .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    DesclaimerView()
}
