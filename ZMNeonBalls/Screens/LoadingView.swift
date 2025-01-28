//
//  LoadingView.swift
//  ZMNeonBalls
//
//  Created by Алексей on 27.01.2025.
//

import SwiftUI

struct LoadingView: View {
    let screen = UIScreen.main.bounds.width
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            Rectangle()
                .fill(K.Colors.color7E35CD.opacity(0.3))
                .frame(width: screen / 1.4, height: screen / 1.4)
                .clipShape(RoundedRectangle(cornerRadius: 29))
                .overlay {
                    RoundedRectangle(cornerRadius: 29).stroke(Color.white.opacity(0.2), lineWidth: 1.5)
                }
                .overlay(content: {
                    K.Images.Balls.volleyBall
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(0.8)
                })
                .rotationEffect(.degrees(-8.13))
                .offset(y: 100)
            
            Rectangle()
                .frame(width: screen / 1.5, height: screen / 1.5)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 29))
                .overlay {
                    RoundedRectangle(cornerRadius: 29).stroke(Color.white.opacity(0.2), lineWidth: 1.5)
                }
                .overlay(content: {
                    K.Images.Balls.tableTennisBall
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(0.9)
                        .blur(radius: 25)
                    K.Images.Balls.tableTennisBall
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(0.8)
                })
                .rotationEffect(.degrees(26.05))
                .offset(x: 20, y: -140)
            
            VStack {
                Spacer()
                Text(K.Texts.Screens.Splash.loading)
                    .font(.custom(K.Fonts.montserratMedium, size: 30))
                    .foregroundStyle(.white)
                    .padding(.bottom, 50)
            }
        }
    }
}

#Preview {
    LoadingView()
}

