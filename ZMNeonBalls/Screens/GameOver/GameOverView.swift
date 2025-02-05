import SwiftUI

struct GameOverView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var quizViewModel: QuizViewModel
    @ObservedObject var menuViewModel: MenuViewModel
    private let storageService: StorageService = StorageService.shared
    @State private var countNewRecords: Int = 0
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                K.Images.gameOver
                    .resizable()
                    .scaledToFit()
            }
            .offset(y: -200)
            
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
                
                Spacer()
                
                Text(K.Texts.Screens.Quiz.result)
                    .foregroundStyle(.white)
                    .font(.custom(K.Fonts.montserratSemibold, size: 30))
                
                if quizViewModel.countNewRecords > 0 {
                    Text(quizViewModel.countNewRecords.description + " " + K.Texts.Screens.Quiz.newRecords)
                        .font(.custom(K.Fonts.montserratSemibold, size: 20))
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .foregroundStyle(.white)
                        .background(Capsule())
                        .foregroundStyle(K.Colors.colorDD39D5)
                }

                AchievementsGameOverView(quizViewModel: quizViewModel)
                
                Button {
                    dismiss()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        quizViewModel.isShowGameOverView = false
                    }
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
//            .padding(.bottom, 60)
        }
        .navigationBarBackButtonHidden(true)
        .customNavBar {
            quizViewModel.isShowGameOverView = false
        }
        .onAppear {
            storageService.updateResultAchievement()
            menuViewModel.getAchievements()
            menuViewModel.updateAchievements()
        }
    }
}

fileprivate struct AchievementsGameOverView: View {
    let quizViewModel: QuizViewModel
    let width: CGFloat = K.screenWidth / 2.5
    let height: CGFloat = K.screenWidth / 3
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                AchievementView(
                    achievement: .speedrun,
                    description: quizViewModel.speedrun,
                    width: width,
                    height: height
                )
                AchievementView(
                    achievement: .connoisseur,
                    description: quizViewModel.connoisseur,
                    width: width,
                    height: height
                )
                AchievementView(
                    achievement: .combo,
                    description: quizViewModel.combo,
                    width: width,
                    height: height
                )
            }
            .padding(.vertical)
        }
    }
}

#Preview {
    NavigationView {
        GameOverView(quizViewModel: QuizViewModel(), menuViewModel: MenuViewModel())
            .environmentObject(QuizViewModel())
            .environmentObject(MenuViewModel())
    }
}
