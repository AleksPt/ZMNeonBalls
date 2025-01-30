//
//  LibraryView.swift
//  ZMNeonBalls
//
//  Created by Алексей on 28.01.2025.
//

import SwiftUI

struct LibraryView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var libraryViewModel = LibraryViewModel()
    @State private var isSelectedBall = false
    @State private var selectedBall: Int? = nil
    
    private let columns: [GridItem]
    private let size: CGFloat
    
    init(size: CGFloat = K.screenHeight / 9, spacing: CGFloat = 10) {
        columns = [
            GridItem(.fixed(size), spacing: spacing),
            GridItem(.fixed(size), spacing: spacing)
        ]
        self.size = size
    }
    
    var body: some View {
        ZStack {
                BackgroundView()
                
                if isSelectedBall, let selectedBall {
                    libraryViewModel.balls[selectedBall].image
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(1.25)
                        .offset(x: K.screenWidth / 1.5)
                }
                
                VStack {
                    HeaderView(
                        title: K.Texts.Screens.Library.title,
                        subtitle: K.Texts.Screens.Library.subtitle
                    )
                    
                    BallsGridView(
                        columns: columns,
                        libraryViewModel: libraryViewModel,
                        isSelectedBall: $isSelectedBall,
                        selectedBall: $selectedBall,
                        size: size
                    )

                    NavigationLink {
                        if let selectedBall {
                            DetailBallView(
                                viewModel: libraryViewModel,
                                indexBall: selectedBall
                            )
                        }
                    } label: {
                        ZStack {
                            Capsule()
                                .frame(width: 100, height: 40)
                                .foregroundStyle(isSelectedBall ? K.Colors.colorE160BA : Color.white)
                            Text(K.Texts.Buttons.read)
                                .font(.custom(K.Fonts.montserratMedium, size: 20))
                                .foregroundStyle(isSelectedBall ? Color.white : Color.black)
                        }
                    }
                    .padding(.bottom, 10)
                    .disabled(!isSelectedBall)
                }
                .padding(.horizontal)
            }
            .navigationBarBackButtonHidden(true)
            .customNavBar {
                dismiss()
            }
    }
}

fileprivate struct BallsGridView: View {
    let columns: [GridItem]
    @ObservedObject var libraryViewModel: LibraryViewModel
    @Binding var isSelectedBall: Bool
    @Binding var selectedBall: Int?
    let size: CGFloat
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(
                columns: columns,
                alignment: .leading,
                spacing: 10
            ) {
                ForEach(Array(libraryViewModel.balls).indices, id: \.self) { index in
                    
                    let ball = libraryViewModel.balls[index]
                    
                    Button {
                        isSelectedBall = true
                        selectedBall = index
                    } label: {
                        Rectangle()
                            .frame(width: size, height: size)
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .overlay {
                                RoundedRectangle(cornerRadius: 15).stroke(Color.white.opacity(0.2), lineWidth: 1.5)
                            }
                            .overlay(content: {
                                if selectedBall == index {
                                    Rectangle()
                                        .clipShape(.rect(cornerRadius: 15))
                                        .foregroundStyle(K.Colors.color7E35CD)
                                }
                                ball.image
                                    .resizable()
                                    .scaledToFit()
                                    .scaleEffect(0.8)
                                    .blur(radius: 5)
                                ball.image
                                    .resizable()
                                    .scaledToFit()
                                    .scaleEffect(0.7)
                            })
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        LibraryView()
    }
}
