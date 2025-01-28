//
//  MenuView.swift
//  ZMNeonBalls
//
//  Created by Алексей on 28.01.2025.
//

import SwiftUI

struct MenuView: View {
    @StateObject private var menuViewModel = MenuViewModel()
    @State private var infoIsChecked: Bool = true
    @State private var playIsChecked: Bool = false
    @State private var recordIsChecked: Bool = false
    @State private var selectedTab = 0 {
        didSet {
            checkedSelectedTab(index: selectedTab)
        }
    }
    
    var body: some View {
        ZStack {
            BackgroundView()
            ZStack(alignment: .bottom) {
                VStack {
                    MenuHeaderView(
                        title: K.Texts.Screens.Menu.title,
                        subtitle: K.Texts.Screens.Menu.subtitle,
                        font: K.Fonts.montserratMedium
                    )
                    .padding(.horizontal)
                    .padding(.bottom, 8)
                    
                    BallsScrollView(balls: DataStoreService.shared.balls)
                        .padding(.bottom)
                    
                    HStack {
                        CapsuleButtonView(
                            isChecked: $infoIsChecked,
                            text: K.Texts.Screens.Menu.infoTitle
                        ) {
                            selectedTab = 0
                        }
                        CapsuleButtonView(
                            isChecked: $playIsChecked,
                            text: K.Texts.Screens.Menu.play
                        ) {
                            selectedTab = 1
                        }
                        CapsuleButtonView(
                            isChecked: $recordIsChecked,
                            text: K.Texts.Screens.Menu.record
                        ) {
                            selectedTab = 2
                        }
                    }
                    .frame(height: 30)
                    .padding(.horizontal)
                    
                    CustomTabView(selectedTab: $selectedTab, menuViewModel: menuViewModel)
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                        .animation(.easeInOut, value: selectedTab)
                        .onChange(of: selectedTab, perform: { newValue in
                            checkedSelectedTab(index: newValue)
                        })
                }
                
                HStack(spacing: 60) {
                    SelectTabButton(direction: .left) {
                        if selectedTab > 0 {
                            selectedTab -= 1
                        } else {
                            selectedTab = 2
                        }
                        
                        checkedSelectedTab(index: selectedTab)
                    }
                    
                    SelectTabButton(direction: .right) {
                        if selectedTab < 2 {
                            selectedTab += 1
                        } else {
                            selectedTab = 0
                        }
                        
                        checkedSelectedTab(index: selectedTab)
                    }
                }
                .padding(.top, 50)
                .padding(.bottom)
            }
            .padding(.vertical)
            .padding(.top, 25)
        }
    }
    
    private func checkedSelectedTab(index: Int) {
        switch index {
        case 0:
            withAnimation {
                infoIsChecked = true
                playIsChecked = false
                recordIsChecked = false
            }
        case 1:
            withAnimation {
                infoIsChecked = false
                playIsChecked = true
                recordIsChecked = false
            }
        case 2:
            withAnimation {
                infoIsChecked = false
                playIsChecked = false
                recordIsChecked = true
            }
        default: break
        }
    }
}

struct MenuHeaderView: View {
    let title: String
    let subtitle: String
    let font: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(subtitle)
                    .font(.custom(font, size: 15))
                    .foregroundStyle(Color.white.opacity(0.49))
                Text(title)
                    .font(.custom(font, size: 55))
                    .foregroundStyle(.white)
            }
            
            Spacer()
        }
    }
}

struct BallsScrollView: View {
    let balls: [Ball]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(balls) { ball in
                    Rectangle()
                        .frame(width: 125, height: 125)
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
            }.padding(.leading)
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

struct CustomTabView: View {
    @Binding var selectedTab: Int
    @ObservedObject var menuViewModel: MenuViewModel
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(menuViewModel.menu.indices, id: \.self) { index in
                
                let item = menuViewModel.menu[index]
                
                ZStack {
                    item.card.imageBacground
                        .resizable()
                    item.card.imageForeground
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(0.9)
                        .blur(radius: 10)
                        .offset(y: 25)
                    item.card.imageForeground
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(0.9)
                        .offset(y: 25)
                    
                    VStack(alignment: .leading) {
                        HStack(alignment: .top, spacing: 15) {
                            Text(item.card.title)
                                .font(.custom(K.Fonts.montserratMedium, size: 50))
                            
                            if let text = item.card.description {
                                Text(text)
                                    .font(.custom(K.Fonts.montserratMedium, size: 15))
                                    .opacity(0.49)
                                    .offset(y: 5)
                            }
                            
                            if selectedTab != 2 {
                                Button {
                                    
                                } label: {
                                    ZStack {
                                        Circle()
                                            .frame(width: 50)
                                            .overlay {
                                                K.Images.arrow
                                                    .scaleEffect(0.35)
                                            }
                                    }
                                    .padding(.leading)
                                }
                                .offset(y: 5)
                                
                            } else {
                                VStack {
                                    ForEach(menuViewModel.achievement) { achievement in
                                        AchievementView(
                                            achievement: achievement,
                                            width: 110,
                                            height: 125
                                        )
                                    }
                                }
                            }
                        }
                        .foregroundStyle(.white)
                        
                        Spacer()
                    }
                    .padding()
                }
                .padding()
                .tag(index)
            }
        }
    }
}

struct SelectTabButton: View {
    enum Direction {
        case left, right
    }
    
    let direction: Direction
    let action: ()->()
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                Circle()
                    .background(.ultraThinMaterial)
                    .clipShape(Circle())
                    .foregroundStyle(K.Colors.color7E35CD)
                    .opacity(0.6)
                    .frame(width: 45)
                    .overlay {
                        switch direction {
                        case .left:
                            K.Images.arrowLeft
                                .scaleEffect(0.25)
                                .offset(x: -1.5)
                        case .right:
                            K.Images.arrowLeft
                                .scaleEffect(0.25)
                                .offset(x: -1.5)
                                .rotationEffect(.degrees(180))
                        }
                    }
            }
        }
    }
}

#Preview {
    MenuView()
}
