//
//  LoaderView.swift
//  ZMNeonBalls
//
//  Created by Алексей on 31.01.2025.
//

import SwiftUI

struct LoaderView: View {
    var progress: CGFloat
    var numProgress: Int
    @State private var animate = false

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 15)
                .frame(width: 150, height: 150)
                .foregroundStyle(.gray.opacity(0.3))
            
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    style: StrokeStyle(
                        lineWidth: 18,
                        lineCap: .round,
                        lineJoin: .round
                    )
                )
                .frame(width: 150, height: 150)
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [.cyan, .blue]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .rotationEffect(.degrees(-90))
                .animation(.linear, value: progress)
            
            HStack(alignment: .bottom, spacing: 0) {
                Text("\(numProgress)").font(.largeTitle)
                    .animation(.default, value: numProgress)
                Text("%").padding(.bottom, 5)
            }
            .foregroundStyle(.white)
            .transaction { transaction in
                transaction.animation = nil
            }
        }
    }
}

#Preview {
    ZStack {
        Color.black
        LoaderView(progress: 5, numProgress: 55)
    }
    .ignoresSafeArea()
}
