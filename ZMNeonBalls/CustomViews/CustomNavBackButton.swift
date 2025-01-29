//
//  CustomNavBackButton.swift
//  ZMNeonBalls
//
//  Created by Алексей on 29.01.2025.
//
import SwiftUI

struct CustomNavBackButton: ViewModifier {
    let action: () -> ()
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        action()
                    } label: {
                        K.Images.arrowLeft
                            .resizable()
                            .scaledToFit()
                            .frame(height: 20)
                            .padding(.leading, 8)
                    }

                }
            }
    }
}
