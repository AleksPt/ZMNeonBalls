//
//  AchievementView.swift
//  ZMNeonBalls
//
//  Created by Алексей on 28.01.2025.
//

import SwiftUI

struct AchievementView: View {
    let achievement: Achievement
    let width: CGFloat
    let height: CGFloat
    let scale: CGFloat = 0.5
    let radius: CGFloat = 15
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: width, height: height)
                .background(.ultraThinMaterial)
                .foregroundStyle(Color.clear)
                .opacity(0.85)
                .clipShape(RoundedRectangle(cornerRadius: radius))
                .overlay {
                    RoundedRectangle(cornerRadius: radius).stroke(Color.white, lineWidth: 0.5)
                }
                .overlay {
                    VStack {
                        ZStack {
                            achievement.image
                                .resizable()
                                .scaledToFit()
                                .scaleEffect(scale + 0.1)
                                .blur(radius: 10)
                            achievement.image
                                .resizable()
                                .scaledToFit()
                                .scaleEffect(scale)
                        }
                        
                        VStack(spacing: 5) {
                            Text(achievement.title)
                                .font(.custom(K.Fonts.montserratBold, size: 12))
                                .foregroundStyle(.white)
                            Text(achievement.description)
                                .font(.custom(K.Fonts.montserratRegular, size: 12))
                                .foregroundStyle(.white.opacity(0.79))
                        }
                        .offset(y: -15)
                    }
                }
        }
    }
}

//#Preview {
//    ZStack {
//        BackgroundView()
//        AchievementView(
//            achievement: Achievement(
//                type: .combo,
//                image: TypeAchievement.combo.image,
//                title: TypeAchievement.combo.title,
//                description: "6"
//            ),
//            width: 125,
//            height: 150
//        )
//    }
//}
