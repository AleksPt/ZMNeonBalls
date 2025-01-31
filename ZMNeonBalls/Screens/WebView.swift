//
//  WebView.swift
//  ZMNeonBalls
//
//  Created by Алексей on 31.01.2025.
//

import SwiftUI
import WebKit

struct WebView: View {
    @State private var isLoading = true
    @State private var progress: Double = 0.0
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            WebViewRepresentable(
                progress: $progress,
                isLoading: $isLoading,
                url: url
            )
            .opacity(isLoading ? 0 : 1)
            .animation(.easeInOut, value: isLoading)
            
            LoaderView(
                progress: CGFloat(progress),
                numProgress: Int(progress * 100)
            )
            .opacity(isLoading ? 1 : 0)
            .animation(.easeInOut, value: isLoading)
            .onAppear {
                withAnimation(.easeInOut(duration: 0.5)) {
                    progress = 0.0
                }
            }
        }
    }
}


struct WebViewRepresentable: UIViewRepresentable {
    @Binding var progress: Double
    @Binding var isLoading: Bool
    let url: URL
    
    init(progress: Binding<Double>, isLoading: Binding<Bool>, url: URL) {
        self._progress = progress
        self._isLoading = isLoading
        self.url = url
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences.allowsContentJavaScript = true
        config.preferences.javaScriptCanOpenWindowsAutomatically = true
        config.mediaTypesRequiringUserActionForPlayback = []
        
        let webView = WKWebView(frame: .zero, configuration: config)
        webView.navigationDelegate = context.coordinator
        webView.allowsBackForwardNavigationGestures = true
        webView.configuration.websiteDataStore = WKWebsiteDataStore.nonPersistent()
        webView.customUserAgent = "Mozilla/5.0 (iPhone; CPU iPhone OS 14_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0 Mobile/15A5341f Safari/604.1"
        
        webView.addObserver(context.coordinator,
                            forKeyPath: #keyPath(WKWebView.estimatedProgress),
                            options: .new,
                            context: nil)
        
        context.coordinator.webView = webView
        
        let request = URLRequest(url: url)
        webView.load(request)
        
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate, WKUIDelegate {
        var parent: WebViewRepresentable
        weak var webView: WKWebView?
        
        init(_ parent: WebViewRepresentable) {
            self.parent = parent
            super.init()
        }
        
        
        override func observeValue(forKeyPath keyPath: String?,
                                   of object: Any?,
                                   change: [NSKeyValueChangeKey : Any]?,
                                   context: UnsafeMutableRawPointer?) {
            if keyPath == "estimatedProgress" {
                if let webView = object as? WKWebView {
                    let currentProgress = webView.estimatedProgress
                    DispatchQueue.main.async {
                        self.parent.progress = max(0.1, currentProgress)
                    }
                }
            }
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            parent.progress = 1.0
            parent.isLoading = false
        }
    }
}

#Preview {
    WebView(url: URL(string: "https://developer.apple.com/")!)
}
