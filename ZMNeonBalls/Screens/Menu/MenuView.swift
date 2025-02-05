import SwiftUI

struct MenuView: View {
    @EnvironmentObject private var menuViewModel: MenuViewModel
    @EnvironmentObject private var libraryViewModel: LibraryViewModel
    @EnvironmentObject private var quizViewModel: QuizViewModel
    @State private var infoIsChecked: Bool = true
    @State private var playIsChecked: Bool = false
    @State private var recordIsChecked: Bool = false
    @State private var selectedTab = 0 {
        didSet {
            checkedSelectedTab(index: selectedTab)
        }
    }
    @State private var activeTab: Int?
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                MenuHeaderView(
                    title: K.Texts.Screens.Menu.title,
                    subtitle: K.Texts.Screens.Menu.subtitle,
                    font: K.Fonts.montserratMedium
                )
                .padding(.horizontal)
                .padding(.bottom, 8)
                
                BallsScrollView(viewModel: libraryViewModel)
                    .padding(.bottom)
                
                CapsuleButtonViews(
                    infoIsChecked: $infoIsChecked,
                    playIsChecked: $playIsChecked,
                    recordIsChecked: $recordIsChecked,
                    selectedTab: $selectedTab
                )
                .frame(height: 30)
                .padding(.horizontal)
                
                CustomTabView(selectedTab: $selectedTab, menuViewModel: menuViewModel) {
                    checkedSelectedTab(index: selectedTab)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .animation(.easeInOut, value: selectedTab)
                .onChange(of: selectedTab, perform: { newValue in
                    checkedSelectedTab(index: newValue)
                })
                .frame(height: K.screenHeight / 1.75)
                .onTapGesture {
                    switch selectedTab {
                    case 0:
                        activeTab = 0
                    case 1:
                        activeTab = 1
                    default:
                        break
                    }
                }
                
                NavigationLink(destination: LibraryView(), tag: 0, selection: $activeTab) {
                    EmptyView()
                }
                NavigationLink(destination: QuizView(quizViewModel: quizViewModel, menuViewModel: menuViewModel), tag: 1, selection: $activeTab) {
                    EmptyView()
                }
                
                Spacer(minLength: 50)
            }
            .padding(.top, 40)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            menuViewModel.getAchievements()
            menuViewModel.updateAchievements()
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

fileprivate struct MenuHeaderView: View {
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
                    .font(.custom(font, size: 45))
                    .foregroundStyle(.white)
            }
            
            Spacer()
        }
    }
}

fileprivate struct BallsScrollView: View {
    let viewModel: LibraryViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(viewModel.balls.indices, id: \.self) { index in
                    
                    let ball = viewModel.balls[index]
                    
                    NavigationLink {
                        DetailBallView(viewModel: viewModel, indexBall: index)
                    } label: {
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
                    .buttonStyle(.plain)
                }
            }.padding(.leading)
        }
    }
}

fileprivate struct CapsuleButtonViews: View {
    @Binding var infoIsChecked: Bool
    @Binding var playIsChecked: Bool
    @Binding var recordIsChecked: Bool
    @Binding var selectedTab: Int
    var body: some View {
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
    }
}

fileprivate struct SelectTabButtonsView: View {
    @Binding var selectedTab: Int
    let action: () -> ()
    var body: some View {
        HStack(spacing: 60) {
            SelectTabButton(direction: .left) {
                if selectedTab > 0 {
                    selectedTab -= 1
                } else {
                    selectedTab = 2
                }
                
                action()
            }
            
            SelectTabButton(direction: .right) {
                if selectedTab < 2 {
                    selectedTab += 1
                } else {
                    selectedTab = 0
                }
                
                action()
            }
        }
    }
}

fileprivate struct CustomTabView: View {
    @Binding var selectedTab: Int
    @ObservedObject var menuViewModel: MenuViewModel
    let action: () -> ()
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(menuViewModel.menu.indices, id: \.self) { index in
                
                let item = menuViewModel.menu[index]
                ZStack {
                    item.card.newImage
                        .resizable()
                        .scaledToFit()
                        .overlay {
                            if index == 2 {
                                HStack {
                                    Spacer()
                                    VStack {
                                        AchievementMenuView(
                                            menuViewModel: menuViewModel,
                                            width: K.screenHeight / 7,
                                            height: K.screenHeight / 7
                                        )
                                            .padding(.trailing, 30)
                                            .padding(.top)
                                        Spacer()
                                    }
                                }
                            }
                        }
                }
            }
        }
        .overlay {
            SelectTabButtonsView(selectedTab: $selectedTab) {
                action()
            }
            .offset(y: K.screenHeight / 4)
        }
    }
}

fileprivate struct AchievementMenuView: View {
    @ObservedObject var menuViewModel: MenuViewModel
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        VStack {
            AchievementView(
                achievement: .speedrun,
                description: menuViewModel.speedrun,
                width: width,
                height: height
            )
            AchievementView(
                achievement: .combo,
                description: menuViewModel.combo,
                width: width,
                height: height
            )
            AchievementView(
                achievement: .connoisseur,
                description: menuViewModel.connoisseur,
                width: width,
                height: height
            )
        }
    }
}

#Preview {
    NavigationView {
        MenuView()
            .environmentObject(LibraryViewModel())
            .environmentObject(MenuViewModel())
    }
}
