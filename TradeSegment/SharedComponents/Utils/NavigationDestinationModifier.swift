//
//  NavigationDestinationModifier.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 21/09/25.
//

import Foundation
import SwiftUI

extension View {
    @ViewBuilder
    public func navigate<Destination: View>(
        isActive: Binding<Bool>,
        destination: Destination?
    ) -> some View {
        background(
            NavigationLink(
                destination: destination,
                isActive: isActive,
                label: EmptyView.init
            )
            .hidden()
        )
    }
}

extension View {
    @ViewBuilder
    public func navigate<Item, Destination: View>(
        item: Binding<Item?>,
        destination: (Item) -> Destination
    ) -> some View {
        navigate(
            isActive: Binding(
                get: { item.wrappedValue != nil },
                set: { if !$0 { item.wrappedValue = nil } }
            ),
            destination: Group {
                if let item = item.wrappedValue {
                    destination(item)
                }
            }
        )
    }
}

extension View {
    @ViewBuilder
    public func navigate<Destination: View>(
        isActive: Binding<Bool>,
        destination: () -> Destination
    ) -> some View {
        background(
            NavigationLink(
                destination: destination(),
                isActive: isActive,
                label: EmptyView.init
            )
            .hidden()
        )
    }
}
