//
//  CapsuleButtonView.swift
//  ZMNeonBalls
//
//  Created by Алексей on 28.01.2025.
//
import SwiftUI

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
