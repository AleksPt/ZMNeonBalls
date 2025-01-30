//
//  BackgroundView.swift
//  ZMNeonBalls
//
//  Created by Алексей on 27.01.2025.
//
import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack {
            K.Colors.color2A1C2E
                .opacity(0.92)
            
            K.Images.background
                .resizable()
                .blendMode(.softLight)
            
            LinearGradient(
                gradient: Gradient(stops: [
                    Gradient.Stop(color: Color.clear, location: 0.7),
                    Gradient.Stop(color: K.Colors.color6F0DBD, location: 1.0),
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
        }
        .scaleEffect(1.01)
        .ignoresSafeArea()
    }
}

#Preview {
    BackgroundView()
}
