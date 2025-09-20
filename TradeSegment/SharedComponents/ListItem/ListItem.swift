//
//  ListItem.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 15/09/25.
//

import SwiftUI

struct ListItem: View {
    let title: String
    let image: String
    
    var body: some View {
        HStack {
            VStack{
                Text(title)
                    .font(.title3)
            }
            
            Spacer()
            
            Image(systemName: image)
                .resizable()
                .frame(width: 24, height: 24)
        }
        .padding([.top, .bottom], 16.0)
    }
}

#Preview {
    ListItem(title: "Open a free account", image: "person")
}
