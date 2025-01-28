//
//  ContentView.swift
//  ZMNeonBalls
//
//  Created by Алексей on 27.01.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        WebView(url: ApiEndpoint.spotify)
    }
}

#Preview {
    ContentView()
}
