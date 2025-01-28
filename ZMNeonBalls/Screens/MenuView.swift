//
//  MenuView.swift
//  ZMNeonBalls
//
//  Created by Алексей on 28.01.2025.
//

import SwiftUI

struct MenuView: View {
    @State private var infoIsChecked: Bool = true
    @State private var playIsChecked: Bool = false
    @State private var recordIsChecked: Bool = false
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text(K.Texts.Screens.Menu.subtitle)
                            .font(.custom(K.Fonts.montserratMedium, size: 15))
                            .foregroundStyle(Color.white.opacity(0.49))
                        Text(K.Texts.Screens.Menu.title)
                            .font(.custom(K.Fonts.montserratMedium, size: 55))
                            .foregroundStyle(.white)
                    }
                    
                    Spacer()
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(DataStoreService.shared.balls) { ball in
                            Rectangle()
                                .frame(width: 100, height: 100)
                                .background(.ultraThinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 15).stroke(Color.white.opacity(0.2), lineWidth: 1.5)
                                }
                                .overlay(content: {
                                    ball.image
                                        .resizable()
                                        .scaledToFit()
                                        .scaleEffect(0.9)
                                        .blur(radius: 10)
                                    ball.image
                                        .resizable()
                                        .scaledToFit()
                                        .scaleEffect(0.8)
                                })
                        }
                    }
                }
                
                HStack {
                    CapsuleButtonView(
                        isChecked: $infoIsChecked,
                        text: K.Texts.Screens.Menu.infoTitle
                    ) {
                        infoIsChecked = true
                        playIsChecked = false
                        recordIsChecked = false
                    }
                    CapsuleButtonView(
                        isChecked: $playIsChecked,
                        text: K.Texts.Screens.Menu.play
                    ) {
                        infoIsChecked = false
                        playIsChecked = true
                        recordIsChecked = false
                    }
                    CapsuleButtonView(
                        isChecked: $recordIsChecked,
                        text: K.Texts.Screens.Menu.record
                    ) {
                        infoIsChecked = false
                        playIsChecked = false
                        recordIsChecked = true
                    }
                }
                .frame(height: 30)
            }
        }
    }
}

struct CapsuleButtonView: View {
    @Binding var isChecked: Bool
    let text: String
    let action: ()->()
    
    var body: some View {
        Button {
            isChecked = true
            action()
        } label: {
            ZStack {
                Capsule()
                    .foregroundStyle(isChecked ? K.Colors.colorE160BA : Color.clear)
                    .overlay(
                        Capsule().stroke(.white, lineWidth: isChecked ? 0 : 1)
                    )
                Text(text)
                    .font(.custom(K.Fonts.montserratMedium, size: 16))
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    MenuView()
}
