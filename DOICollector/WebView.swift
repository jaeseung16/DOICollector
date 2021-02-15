//
//  WebView.swift
//  DOICollector
//
//  Created by Jae Seung Lee on 2/15/21.
//

import SwiftUI
import WebKit

struct WebView: NSViewRepresentable {
    let url: URL
    
    func makeNSView(context: NSViewRepresentableContext<WebView>) -> WKWebView {
        let configuration = WKWebViewConfiguration()
        
        let webView = WKWebView(frame: CGRect.zero, configuration: configuration)
        
        let request = URLRequest(url: url)
        webView.load(request)
        return webView
    }

    func updateNSView(_ uiView: WKWebView, context: Context) {
        
    }
    
}
