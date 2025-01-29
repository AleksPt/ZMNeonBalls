//
//  QuizViewModel.swift
//  ZMNeonBalls
//
//  Created by Алексей on 29.01.2025.
//

import Foundation

final class QuizViewModel: ObservableObject {
    private let dataStore: DataStoreService = DataStoreService.shared
    
    @Published var questions: [Question] = []
    @Published var timeProgress: Double = 30
    @Published var isShowGameOverView: Bool = false
    @Published var currentStep = 1
    
    let totalTime: Double = 30
    var countCorrectAnswers = 0
    
    private var timer: Timer?
    
    init() {
        questions = dataStore.questions
    }
    
    func startQuiz() {
        startTimer()
        countCorrectAnswers = 0
    }
    
    func checkIsCorrectAnswer(answerIndex: Int) {
        guard currentStep < questions.count else {
            finishQuiz()
            return
        }
        
        if questions[currentStep - 1].answers[answerIndex].isCorrect {
            countCorrectAnswers += 1
        }
        
        currentStep += 1
        resetTimer()
    }
    
    func finishQuiz(tapToBack: Bool = false) {
        stopTimer()
        timeProgress = totalTime
        
        if !tapToBack {
            isShowGameOverView = true
        }
    }
    
    func startTimer() {
        timeProgress = totalTime
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            
            if timeProgress > 0 {
                timeProgress -= 1
            } else {
                finishQuiz()
            }
        }
    }
    
    func resetTimer() {
        stopTimer()
        startTimer()
    }
    
    func stopTimer() {
        timeProgress = 0
        timer?.invalidate()
    }
    
    deinit {
        stopTimer()
    }
}
