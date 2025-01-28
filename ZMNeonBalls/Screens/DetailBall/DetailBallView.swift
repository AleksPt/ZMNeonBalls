//
//  DetailBallView.swift
//  ZMNeonBalls
//
//  Created by Алексей on 28.01.2025.
//

import SwiftUI

struct DetailBallView: View {
    @ObservedObject var viewModel: LibraryViewModel
    @State var indexBall: Int = 0
    
    @State private var infoIsChecked: Bool = true
    @State private var factIsChecked: Bool = false
    @State private var gameIsChecked: Bool = false
    
    @State private var infoSelectedFirstView: Bool = false
    @State private var selectedCapsuleButton = 0 {
        didSet {
            checkedSelectedTab(index: selectedCapsuleButton)
        }
    }
        
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                HeaderView(
                    title: viewModel.balls[indexBall].title,
                    subtitle: viewModel.balls[indexBall].description
                )
                .padding(.horizontal)
                
                TabDetailBallView(
                    viewModel: viewModel,
                    indexBall: $indexBall
                )
                .padding(.top, -40)
                
                HStack {
                    CapsuleButtonView(
                        isChecked: $infoIsChecked,
                        text: K.Texts.Screens.BallDetailCard.Info.info) {
                            selectedCapsuleButton = 0
                        }
                    CapsuleButtonView(
                        isChecked: $factIsChecked,
                        text: K.Texts.Screens.BallDetailCard.Fact.fact) {
                            selectedCapsuleButton = 1
                        }
                    CapsuleButtonView(
                        isChecked: $gameIsChecked,
                        text: K.Texts.Screens.BallDetailCard.Game.game) {
                            selectedCapsuleButton = 2
                        }
                }
                .frame(height: 30)
                .padding(.horizontal)
                .padding(.bottom)
                
                InfoViewDetailBall(infoSelectedFirstView: $infoSelectedFirstView)
                
                if selectedCapsuleButton == 0 {
                    SwitchButtonView(
                        infoSelectedFirstView: $infoSelectedFirstView
                    )
                }
            }
            .padding(.vertical)
        }

    }
    
    private func checkedSelectedTab(index: Int) {
        switch index {
        case 0:
            withAnimation {
                infoIsChecked = true
                factIsChecked = false
                gameIsChecked = false
            }
        case 1:
            withAnimation {
                infoIsChecked = false
                factIsChecked = true
                gameIsChecked = false
            }
        case 2:
            withAnimation {
                infoIsChecked = false
                factIsChecked = false
                gameIsChecked = true
            }
        default: break
        }
    }
}

struct TabDetailBallView: View {
    @ObservedObject var viewModel: LibraryViewModel
    @Binding var indexBall: Int
    
    var body: some View {
        TabView(selection: $indexBall) {
            ForEach(viewModel.balls.indices, id: \.self) { index in
                
                let ball = viewModel.balls[index]
                
                ZStack {
                    ball.image
                        .resizable()
                        .scaledToFit()
                        .blur(radius: 20)
                    ball.image
                        .resizable()
                        .scaledToFit()
                }
                .padding(40)
            }
        }
        .onChange(of: indexBall, perform: { newValue in
            withAnimation {
                indexBall = newValue
            }
        })
        .overlay(
            HStack(spacing: K.screenWidth / 2.25) {
                SelectTabButton(direction: .left) {
                    withAnimation {
                        if indexBall > 0 {
                            indexBall -= 1
                        } else {
                            indexBall = viewModel.balls.count - 1
                        }
                    }
                }
                
                SelectTabButton(direction: .right) {
                    withAnimation {
                        if indexBall < viewModel.balls.count - 1 {
                            indexBall += 1
                        } else {
                            indexBall = 0
                        }
                    }
                }

            }
                .scaleEffect(1.25)
                .offset(y: -20),
            alignment: .bottom
        )
        .tabViewStyle(.page)
    }
}

struct InfoViewDetailBall: View {
    @Binding var infoSelectedFirstView: Bool
    
    var body: some View {
        if infoSelectedFirstView {
            HStack(spacing: 15) {
                VStack(spacing: 15) {
                    Rectangle()
                        .foregroundStyle(K.Colors.color423AB9)
                        .clipShape(.rect(cornerRadius: 20))
                        .overlay(
                            Text(K.Texts.Screens.BallDetailCard.Info.country)
                                .font(.custom(K.Fonts.montserratMedium, size: 20))
                                .foregroundStyle(.white)
                                .padding(),
                            alignment: .topLeading
                        )
                        .overlay(
                            CircleButtonView(
                                width: 30,
                                scale: 0.20) {
                                    
                                }
                                .foregroundStyle(.white)
                                .padding(),
                            alignment: .bottomTrailing
                        )
                    
                    Rectangle()
                        .foregroundStyle(.white)
                        .overlay {
                            K.Images.DetailBall.size
                                .resizable()
                                .scaledToFill()
                        }
                        .overlay(
                            Text(K.Texts.Screens.BallDetailCard.Info.size)
                                .font(.custom(K.Fonts.montserratMedium, size: 20))
                                .foregroundStyle(.white)
                                .padding(),
                            alignment: .topLeading
                        )
                        .overlay(
                            CircleButtonView(
                                width: 30,
                                scale: 0.20) {
                                    
                                }
                                .foregroundStyle(.white)
                                .padding(),
                            alignment: .bottomTrailing
                        )
                        .clipShape(.rect(cornerRadius: 20))
                }
                
                VStack(spacing: 0) {
                    ZStack {
                        Rectangle()
                            .foregroundStyle(.white)
                            .cornerRadius(20, corners: [.topLeft, .topRight])
                        VStack(alignment: .leading) {
                            Text(K.Texts.Screens.BallDetailCard.Info.materialsTitle)
                                .font(.custom(K.Fonts.montserratMedium, size: 20))
                            Text(K.Texts.Screens.BallDetailCard.Info.materialsDescription)
                                .font(.custom(K.Fonts.montserratMedium, size: 15))
                                .foregroundStyle(.gray)
                        }
                        .padding()
                    }
                    Rectangle()
                        .foregroundStyle(.white)
                        .overlay {
                            K.Images.DetailBall.material
                                .resizable()
                                .scaledToFill()
                        }
                        .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
                }
            }
            .frame(height: K.screenWidth / 2)
            .padding(.horizontal)
        } else {
            HStack {
                Rectangle()
                    .foregroundStyle(K.Colors.color423AB9)
                    .clipShape(.rect(cornerRadius: 20))
                    .overlay(
                        Text(K.Texts.Screens.BallDetailCard.Info.ballStructure)
                            .font(.custom(K.Fonts.montserratMedium, size: 20))
                            .foregroundStyle(.white)
                            .padding(),
                        alignment: .topLeading
                    )
                    .overlay(
                        CircleButtonView(
                            width: 30,
                            scale: 0.20) {
                                
                            }
                            .foregroundStyle(.white)
                            .padding(),
                        alignment: .bottomTrailing
                    )
                Rectangle()
                    .foregroundStyle(.white)
                    .overlay {
                        K.Images.DetailBall.characteristic
                            .resizable()
                            .scaledToFill()
                    }
                    .overlay(
                        Text(K.Texts.Screens.BallDetailCard.Info.characteristic)
                            .minimumScaleFactor(0.5)
                            .lineLimit(2)
                            .font(.custom(K.Fonts.montserratMedium, size: 20))
                            .foregroundStyle(.white)
                            .padding(),
                        alignment: .topLeading
                    )
                    .overlay(
                        CircleButtonView(
                            width: 30,
                            scale: 0.20) {
                                
                            }
                            .foregroundStyle(.white)
                            .padding(),
                        alignment: .bottomTrailing
                    )
                    .clipShape(.rect(cornerRadius: 20))
            }
            .frame(height: K.screenWidth / 2)
            .padding(.horizontal)
        }
    }
}

struct SwitchButtonView: View {
    @Binding var infoSelectedFirstView: Bool
    
    var body: some View {
        Button {
            withAnimation {
                infoSelectedFirstView.toggle()
            }
        } label: {
            Capsule()
                .frame(width: 70, height: 30)
                .foregroundStyle(K.Colors.colorE160BA)
                .overlay(
                    HStack(spacing: 10) {
                        Circle()
                            .foregroundStyle(infoSelectedFirstView ? .white : .white.opacity(0.33))
                        Circle()
                            .foregroundStyle(!infoSelectedFirstView ? .white : .white.opacity(0.33))
                    }
                        .frame(width: 50)
                )
                .padding(.vertical, 20)
        }
    }
}

#Preview {
    DetailBallView(viewModel: LibraryViewModel(), indexBall: 2)
}
