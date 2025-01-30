//
//  QuizView.swift
//  ZMNeonBalls
//
//  Created by Алексей on 29.01.2025.
//

import SwiftUI

struct QuizView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var quizViewModel: QuizViewModel
    @State private var isSelectedAnswer = false
    @State private var selectedAnswer: Int? = nil
    
    private let columns = [
        GridItem(.fixed(K.screenWidth / 2.5), spacing: 10),
        GridItem(.fixed(K.screenWidth / 2.5), spacing: 10)
    ]
    
    var body: some View {
        if quizViewModel.isShowGameOverView {
            GameOverView()
        } else {
            ZStack {
                BackgroundView()
                
                BackgroundBallsView()
                
                VStack {
                    ProgressView(
                        currentStep: quizViewModel.currentStep,
                        totalSteps: quizViewModel.questions.count
                    )
                    .padding(.horizontal)
                    .padding(.bottom, -20)
                    
                    ZStack {
                        QuestionShape(
                            questionNumber: quizViewModel.currentStep,
                            text: quizViewModel.questions[quizViewModel.currentStep - 1].title,
                            width: K.screenWidth - 35,
                            height: 250
                        )
                        
                        TimerProgressView(
                            totalTime: quizViewModel.totalTime,
                            progress: quizViewModel.timeProgress
                        )
                        .offset(y: -75)
                    }
                    
                    AnswersView(
                        size: K.screenWidth / 2.5,
                        answers: quizViewModel.questions[quizViewModel.currentStep - 1].answers,
                        columns: columns,
                        isSelectedAnswer: $isSelectedAnswer,
                        selectedAnswer: $selectedAnswer
                    )
                    Button {
                        if let selectedAnswer {
                            quizViewModel.checkIsCorrectAnswer(answerIndex: selectedAnswer)
                            isSelectedAnswer = false
                            self.selectedAnswer = nil
                        }
                    } label: {
                        ZStack {
                            Capsule()
                                .frame(width: 100, height: 40)
                                .foregroundStyle(isSelectedAnswer ? K.Colors.colorE160BA : Color.white)
                            Text(K.Texts.Buttons.next)
                                .font(.custom(K.Fonts.montserratMedium, size: 20))
                                .foregroundStyle(isSelectedAnswer ? Color.white : K.Colors.color580A9C)
                        }
                    }
                    .disabled(!isSelectedAnswer)
                }
                .padding(.bottom, 50)
            }
            .navigationBarBackButtonHidden(true)
            .customNavBar {
                dismiss()
                quizViewModel.finishQuiz(abortQuiz: true)
            }
            .onAppear {
                quizViewModel.startQuiz()
            }
        }
    }
}

struct BackgroundBallsView: View {
    var body: some View {
        ZStack {
            K.Images.Balls.beachBall
                .resizable()
                .scaledToFit()
                .scaleEffect(0.55)
                .blur(radius: 15)
                .offset(x: K.screenWidth / 2, y: -K.screenWidth / 1.75)
            K.Images.Balls.beachBall
                .resizable()
                .scaledToFit()
                .scaleEffect(0.5)
                .offset(x: K.screenWidth / 2, y: -K.screenWidth / 1.75)
        }
        
        ZStack {
            K.Images.Balls.beachBall
                .resizable()
                .scaledToFit()
                .scaleEffect(0.35)
                .blur(radius: 15)
                .offset(x: -K.screenWidth / 2, y: -K.screenWidth / 2)
            K.Images.Balls.beachBall
                .resizable()
                .scaledToFit()
                .scaleEffect(0.3)
                .rotationEffect(.degrees(180))
                .offset(x: -K.screenWidth / 2, y: -K.screenWidth / 2)
        }
    }
}

struct ProgressView: View {
    let currentStep: Int
    let totalSteps: Int
    
    var body: some View {
        HStack(spacing: 15) {
            ProgressBar(currentStep: currentStep, totalSteps: totalSteps)
                .frame(height: 8)
            Capsule()
                .foregroundStyle(K.Colors.colorE160BA)
                .frame(width: 100, height: 30)
                .overlay {
                    Text(currentStep < 10 ? "0\(currentStep) of \(totalSteps)" : "\(currentStep) of \(totalSteps)")
                        .foregroundStyle(.white)
                        .font(.custom(K.Fonts.montserratMedium, size: 15))
                }
        }
    }
}

struct ProgressBar: View {
    var currentStep: Int
    var totalSteps: Int
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Capsule()
                    .foregroundColor(.white)
                
                Capsule()
                    .foregroundColor(K.Colors.colorE160BA)
                    .frame(width: geometry.size.width * CGFloat(currentStep) / CGFloat(totalSteps))
            }
            .cornerRadius(10)
        }
    }
}

struct QuestionShape: View {
    let questionNumber: Int
    let text: String
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        ZStack {
            Rectangle()
                .background(.ultraThinMaterial)
                .foregroundStyle(.white)
                .opacity(0.3)
                .frame(width: width, height: height)
                .clipShape(
                    Path { path in
                        path.addRoundedRect(
                            in: CGRect(x: 0, y: 0, width: width, height: height - 50),
                            cornerSize: CGSize(width: 20, height: 20)
                        )
                        
                        path.move(to: CGPoint(x: width/2, y: height - 50))
                        path.addArc(
                            center: CGPoint(x: width/2, y: height - 50),
                            radius: 40,
                            startAngle: .degrees(0),
                            endAngle: .degrees(180),
                            clockwise: true
                        )
                    }
                )
                .overlay(
                    BlurView(style: .systemMaterial)
                        .clipShape(
                            Path { path in
                                path.addRoundedRect(
                                    in: CGRect(x: 0, y: 0, width: width, height: height - 50),
                                    cornerSize: CGSize(width: 20, height: 20)
                                )
                                
                                path.move(to: CGPoint(x: width/2, y: height - 50))
                                path.addArc(
                                    center: CGPoint(x: width/2, y: height - 50),
                                    radius: 40,
                                    startAngle: .degrees(0),
                                    endAngle: .degrees(180),
                                    clockwise: true
                                )
                            }
                        )
                )
                .rotationEffect(.degrees(180))
            
            VStack {
                HStack {
                    Text("Question")
                        .foregroundStyle(.white)
                    Text(questionNumber < 10 ? "0" + questionNumber.description : questionNumber.description)
                        .foregroundStyle(K.Colors.colorE160BA)
                }
                .font(.custom(K.Fonts.montserratSemibold, size: 25))
                
                Text("Science Quiz")
                    .foregroundStyle(.white.opacity(0.4))
                    .padding(.bottom, -5)
                
                DashedLineView(width: width / 1.25)
                
                Text(text)
                    .lineLimit(3)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white)
                    .font(.custom(K.Fonts.montserratSemibold, size: 15))
                    .frame(width: width / 1.15)
                    .frame(minHeight: 70)
            }
            .padding(.top, 80)
        }
    }
    
    struct DashedLineView: View {
        let width: CGFloat
        
        var body: some View {
            Path { path in
                path.move(to: CGPoint(x: 0, y: 10))
                path.addLine(to: CGPoint(x: width, y: 10))
            }
            .stroke(style: StrokeStyle(lineWidth: 2, dash: [5, 10]))
            .foregroundColor(.white.opacity(0.26))
            .frame(width: width, height: 10)
        }
    }
}

struct TimerProgressView: View {
    var totalTime: Double
    var progress: Double
    var lineWidth: CGFloat = 7.5
    
    var body: some View {
        ZStack {
            Circle()
                .background(.ultraThinMaterial)
                .foregroundStyle(K.Colors.color7E35CD)
                .opacity(0.3)
                .clipShape(Circle())
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(progress / totalTime, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                .foregroundColor(K.Colors.colorE160BA)
                .animation(.linear, value: progress)
                .scaleEffect(0.8)
            
            Text(Int(progress).description)
                .foregroundStyle(.white)
                .font(.custom(K.Fonts.montserratMedium, size: 20))
        }
        .frame(width: 70)
    }
}

struct AnswersView: View {
    let size: CGFloat
    let answers: [Answer]
    let columns: [GridItem]
    @Binding var isSelectedAnswer: Bool
    @Binding var selectedAnswer: Int?
    
    var body: some View {
        LazyVGrid(
            columns: columns,
            alignment: .center,
            spacing: 10
        ) {
            ForEach(Array(answers).indices, id: \.self) { index in
                
                let question = answers[index]
                
                Button {
                    isSelectedAnswer = true
                    selectedAnswer = index
                } label: {
                    Rectangle()
                        .frame(width: size, height: size)
                        .background(.ultraThinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .overlay {
                            RoundedRectangle(cornerRadius: 15).stroke(Color.white.opacity(0.2), lineWidth: 1.5)
                        }
                        .overlay(
                            content: {
                                if selectedAnswer == index {
                                    RoundedRectangle(cornerRadius: 15).stroke(
                                        Color.white,
                                        lineWidth: 1
                                    )
                                    Rectangle()
                                        .clipShape(.rect(cornerRadius: 15))
                                        .foregroundStyle(K.Colors.color7E35CD)
                            }
                            
                            if let image = question.image {
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .blur(radius: 20)
                                    .frame(width: size / 1.5)
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: size / 1.5)
                            }
                            
                            if let text = question.title {
                                Text(text)
                                    .multilineTextAlignment(.center)
                                    .foregroundStyle(.white)
                                    .font(.custom(K.Fonts.montserratMedium, size: 20))
                            }
                        })
                }
                .buttonStyle(.plain)
            }
        }
    }
}

#Preview {
    NavigationView {
        QuizView()
            .environmentObject(QuizViewModel())
    }
}
