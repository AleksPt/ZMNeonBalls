//
//  WebView.swift
//  ZMNeonBalls
//
//  Created by Алексей on 28.01.2025.
//

import SwiftUI
import WebKit

struct WebView: View {
    @State private var isLoading = true
    @State private var progress: Double = 0.0
    let url: String
    
    init(url: String) {
        self.url = url
    }
    
    var body: some View {
        ZStack {
            Color.black
            
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
        .ignoresSafeArea(.all)
    }
}


struct WebViewRepresentable: UIViewRepresentable {
    @Binding var progress: Double
    @Binding var isLoading: Bool
    let url: String
    
    init(progress: Binding<Double>, isLoading: Binding<Bool>, url: String) {
        self._progress = progress
        self._isLoading = isLoading
        self.url = url
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.isOpaque = false
        webView.backgroundColor = .clear
        webView.scrollView.backgroundColor = .clear
        webView.navigationDelegate = context.coordinator
        
        webView.addObserver(context.coordinator,
                            forKeyPath: #keyPath(WKWebView.estimatedProgress),
                            options: .new,
                            context: nil)
        
        context.coordinator.webView = webView
        
        if let url = URL(string: url){
            let request = URLRequest(url: url)
            webView.load(request)
        }
        
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {}
    
    class Coordinator: NSObject, WKNavigationDelegate {
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
                        withAnimation(.easeInOut(duration: 0.3)) {
                            self.parent.progress = max(0.1, currentProgress)
                        }
                    }
                }
            }
        }
        
        func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
            DispatchQueue.main.async {
                self.parent.isLoading = true
            }
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            DispatchQueue.main.async {
                withAnimation(.easeInOut(duration: 0.3)) {
                    self.parent.progress = 1.0
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.parent.isLoading = false
                }
            }
        }
        
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            DispatchQueue.main.async {
                self.parent.isLoading = true
                if self.parent.progress < 0.1 {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        self.parent.progress = 0.1
                    }
                }
            }
        }
    }
}


#Preview {
    WebView(url: ApiEndpoint.spotify)
}
