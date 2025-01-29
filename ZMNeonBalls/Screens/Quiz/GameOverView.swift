//
//  GameOverView.swift
//  ZMNeonBalls
//
//  Created by Алексей on 29.01.2025.
//

import SwiftUI

struct GameOverView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                K.Images.gameOver
                    .resizable()
                    .scaledToFit()
                Spacer()
            }
            
            K.Images.star
                .resizable()
                .scaledToFit()
                .frame(width: 30)
                .offset(x: 150, y: -120)
            
            K.Images.star
                .resizable()
                .scaledToFit()
                .frame(width: 30)
                .offset(x: -110, y: 60)
            
            K.Images.star
                .resizable()
                .scaledToFit()
                .frame(width: 15)
                .offset(x: -135, y: -60)
            
            VStack {
                Text(K.Texts.Screens.Quiz.gameOver)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white)
                    .font(.custom(K.Fonts.montserratBold, size: 80))
                    .padding(.top, 50)
                
                Spacer()
                
                Text(K.Texts.Screens.Quiz.result)
                    .foregroundStyle(.white)
                    .font(.custom(K.Fonts.montserratSemibold, size: 30))
                
                Text(K.Texts.Screens.Quiz.newRecords)
                    .font(.custom(K.Fonts.montserratSemibold, size: 20))
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .foregroundStyle(.white)
                    .background(Capsule())
                    .foregroundStyle(K.Colors.colorDD39D5)
                
                Button {
                    
                } label: {
                    ZStack {
                        Capsule()
                            .frame(width: 100, height: 40)
                            .foregroundStyle(Color.white)
                        Text(K.Texts.Buttons.menu)
                            .font(.custom(K.Fonts.montserratMedium, size: 20))
                            .foregroundStyle(K.Colors.color580A9C)
                    }
                }
            }
            .padding(.bottom, 60)
        }
        .navigationBarBackButtonHidden(true)
        .customNavBar {
            dismiss()
        }
    }
}

#Preview {
    NavigationView {
        GameOverView()
    }
}
