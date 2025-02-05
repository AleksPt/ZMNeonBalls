import Foundation

final class QuizViewModel: ObservableObject {
    private let dataStore: DataStoreService = DataStoreService.shared
    private let storageService: StorageService = StorageService.shared
    
    @Published var questions: [Question] = []
    @Published var timeProgress: Double = 30
    @Published var isShowGameOverView: Bool = false
    @Published var currentStep = 1
    @Published var countNewRecords = 0
    
    let totalTime: Double = 30
    
    var connoisseur: String {
        return "\(countCorrectAnswers)" + "/" + "\(questions.count)"
    }
    var combo: String {
        return maxComboCount.description
    }
    var speedrun: String {
        let minutes = allTime / 60
        let seconds = allTime % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    var maxComboCount: Int = 0
    var countCorrectAnswers = 0
    var allTime: Int = 0
    
    private var currentComboCount: Int = 0
    private var timerRound: Timer?
    
    init() {
        questions = dataStore.questions
    }
    
    func startQuiz() {
        startTimer()
        countCorrectAnswers = 0
        allTime = 0
        maxComboCount = 0
        countNewRecords = 0
    }
    
    func checkIsCorrectAnswer(answerIndex: Int) {
        if questions[currentStep - 1].answers[answerIndex].isCorrect {
            countCorrectAnswers += 1
            currentComboCount += 1
            if currentComboCount > maxComboCount {
                maxComboCount = currentComboCount
            }
        } else {
            currentComboCount = 0
        }
        
        guard currentStep < questions.count else {
            finishQuiz()
            return
        }
        
        currentStep += 1
        startTimer()
    }
    
    func finishQuiz(abortQuiz: Bool = false) {
        stopTimer()
        timeProgress = totalTime
        currentStep = 1
        saveResult()
        
        if abortQuiz == false {
            isShowGameOverView = true
        }
    }
    
    func startTimer() {
        stopTimer()
        timeProgress = totalTime
        
        timerRound = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            
            if timeProgress > 0 {
                timeProgress -= 1
                allTime += 1
            } else {
                finishQuiz()
            }
        }
    }
    
    func stopTimer() {
        timeProgress = 0
        timerRound?.invalidate()
        timerRound = nil
    }
    
    private func saveResult() {
        if let speedrun = storageService.speedrunResult {
            if allTime < speedrun || speedrun == 0 {
                storageService.saveResultAchievement(value: allTime, achievement: .speedrun)
                countNewRecords += 1
            }
        } else {
            storageService.saveResultAchievement(value: allTime, achievement: .speedrun)
            countNewRecords += 1
        }
        
        if let combo = storageService.comboResult {
            if maxComboCount > combo {
                storageService.saveResultAchievement(value: maxComboCount, achievement: .combo)
                countNewRecords += 1
            }
        } else {
            storageService.saveResultAchievement(value: maxComboCount, achievement: .combo)
            countNewRecords += 1
        }
        
        if let connoisseur = storageService.connoisseurResult {
            if countCorrectAnswers > connoisseur {
                storageService.saveResultAchievement(value: countCorrectAnswers, achievement: .connoisseur)
                countNewRecords += 1
            }
        } else {
            storageService.saveResultAchievement(value: countCorrectAnswers, achievement: .connoisseur)
            countNewRecords += 1
        }
    }
    
    deinit {
        stopTimer()
    }
}
