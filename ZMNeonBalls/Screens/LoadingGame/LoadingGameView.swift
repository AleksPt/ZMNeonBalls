import SwiftUI

struct LoadingGameView: View {
    @StateObject private var menuViewModel = MenuViewModel()
    @StateObject private var libraryViewModel = LibraryViewModel()
    @StateObject private var quizViewModel = QuizViewModel()
    @State private var goToMenuView = false

    var body: some View {
        NavigationView {
            VStack {
                if goToMenuView {
                    MenuView()
                        .environmentObject(menuViewModel)
                        .environmentObject(libraryViewModel)
                        .environmentObject(quizViewModel)
                } else {
                    ZStack {
                        BackgroundView()
                        
                        Rectangle()
                            .fill(K.Colors.color7E35CD.opacity(0.3))
                            .frame(width: K.screenHeight / 4, height: K.screenHeight / 4)
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
                            .offset(y: 50)
                        
                        Rectangle()
                            .frame(width: K.screenHeight / 4, height: K.screenHeight / 4)
                            .background(.ultraThinMaterial)
                            .opacity(0.8)
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
                                .padding(.bottom, 10)
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    withAnimation {
                        goToMenuView = true
                    }
                }
            }
        }
    }
}

#Preview {
    LoadingGameView()
        .environmentObject(LibraryViewModel())
        .environmentObject(MenuViewModel())
}

