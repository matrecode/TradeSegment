//
//  WebView.swift
//  TradeSegment
//
//  Created by Matre Akshay Dilansing on 15/09/25.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    internal func makeUIView(context: Context) -> some UIView {
        let webView = WKWebView()
        webView.load(URLRequest(url: self.url))
        return webView
    }
    
    internal func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
