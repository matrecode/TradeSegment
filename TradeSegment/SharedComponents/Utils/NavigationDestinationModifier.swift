//
//  NavigationDestinationModifier.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 21/09/25.
//

import Foundation
import SwiftUI

// Helper modifier for iOS 16+
@available(iOS 16, *)
private struct NavigationDestinationModifier<Destination: View>: ViewModifier {
    @Binding var isActive: Bool
    var destination: Destination?
    
    func body(content: Content) -> some View {
        content.navigationDestination(isPresented: $isActive) {
            destination
        }
    }
}

// A helper ViewModifier for the iOS 16+ implementation.
@available(iOS 16, *)
private struct NavigationDestinationClosureModifier<Destination: View>: ViewModifier {
    @Binding var isActive: Bool
    @ViewBuilder var destination: () -> Destination
    
    func body(content: Content) -> some View {
        content.navigationDestination(isPresented: $isActive, destination: destination)
    }
}

extension View {
    @ViewBuilder
    public func navigate<Destination: View>(
        isActive: Binding<Bool>,
        destination: Destination?
    ) -> some View {
        if #available(iOS 16, *) {
            self.modifier(
                NavigationDestinationModifier(
                    isActive: isActive,
                    destination: destination
                )
            )
        } else {
            self.background(
                NavigationLink(
                    destination: destination,
                    isActive: isActive,
                    label: EmptyView.init
                )
                .hidden()
            )
        }
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
        @ViewBuilder destination: @escaping () -> Destination
    ) -> some View {
        if #available(iOS 16, *) {
            self.modifier(
                NavigationDestinationClosureModifier(
                    isActive: isActive,
                    destination: destination
                )
            )
        } else {
            self.background(
                NavigationLink(
                    destination: destination(),
                    isActive: isActive,
                    label: EmptyView.init
                )
                .hidden()
            )
        }
    }
}
