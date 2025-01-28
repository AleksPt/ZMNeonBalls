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
    @State private var selectedTab = 0
    @StateObject private var menuViewModel = MenuViewModel()
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
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
                    .padding(.horizontal)
                    .padding(.bottom, 8)
                    
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
                        }.padding(.leading)
                    }
                    .padding(.bottom)
                    
                    HStack {
                        CapsuleButtonView(
                            isChecked: $infoIsChecked,
                            text: K.Texts.Screens.Menu.infoTitle
                        ) {
                            infoIsChecked = true
                            playIsChecked = false
                            recordIsChecked = false
                            selectedTab = 0
                        }
                        CapsuleButtonView(
                            isChecked: $playIsChecked,
                            text: K.Texts.Screens.Menu.play
                        ) {
                            infoIsChecked = false
                            playIsChecked = true
                            recordIsChecked = false
                            selectedTab = 1
                        }
                        CapsuleButtonView(
                            isChecked: $recordIsChecked,
                            text: K.Texts.Screens.Menu.record
                        ) {
                            infoIsChecked = false
                            playIsChecked = false
                            recordIsChecked = true
                            selectedTab = 2
                        }
                    }
                    .frame(height: 30)
                    .padding(.horizontal)
                    
                    CustomTabView(selectedTab: $selectedTab, menuViewModel: menuViewModel)
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                        .animation(.easeInOut, value: selectedTab)
                }
                
                Spacer()
                
                HStack {
                    Button {
                        
                    } label: {
                        
                    }

                }
            }
            .padding(.top, 50)
            .padding(.bottom)
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
                        HStack(alignment: .center, spacing: 15) {
                            Text(item.card.title)
                                .font(.custom(K.Fonts.montserratMedium, size: 50))
                            
                            if let text = item.card.description {
                                Text(text)
                                    .font(.custom(K.Fonts.montserratMedium, size: 15))
                                    .opacity(0.49)
                                    .offset(y: 5)
                            } else {
                                Spacer()
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

#Preview {
    MenuView()
}
