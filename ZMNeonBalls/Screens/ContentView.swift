//
//  ContentView.swift
//  ZMNeonBalls
//
//  Created by Алексей on 27.01.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var menuViewModel = MenuViewModel()
    @StateObject private var libraryViewModel = LibraryViewModel()
    @StateObject private var quizViewModel = QuizViewModel()
    
    var body: some View {
        LoadingView()
            .environmentObject(menuViewModel)
            .environmentObject(libraryViewModel)
            .environmentObject(quizViewModel)
    }
}

#Preview {
    ContentView()
}
