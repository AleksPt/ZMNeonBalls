//
//  DataStoreService.swift
//  ZMNeonBalls
//
//  Created by Алексей on 27.01.2025.
//

import Foundation

final class DataStoreService {
    static let shared = DataStoreService()
    
    private(set) var questions: [Question] = []
    private(set) var balls: [Ball] = []
    
    private init() {
        questions = getQuestions()
    }
    
    private func getQuestions() -> [Question] {
        let questions = [
            Question(
                title: K.Texts.Quiz.Question1.question,
                answers: [
                    Answer(
                        title: nil,
                        image: K.Images.Balls.tableTennisBall,
                        isCorrect: false
                    ),
                    Answer(
                        title: nil,
                        image: K.Images.Balls.basketBall,
                        isCorrect: false
                    ),
                    Answer(
                        title: nil,
                        image: K.Images.Balls.footBall,
                        isCorrect: true
                    ),
                    Answer(
                        title: nil,
                        image: K.Images.Balls.volleyBall,
                        isCorrect: false
                    )
                ]
            ),
            
            Question(
                title: K.Texts.Quiz.Question2.question,
                answers: [
                    Answer(
                        title: K.Texts.Quiz.Question2.answer1,
                        image: nil,
                        isCorrect: false
                    ),
                    Answer(
                        title: K.Texts.Quiz.Question2.answer2,
                        image: nil,
                        isCorrect: false
                    ),
                    Answer(
                        title: K.Texts.Quiz.Question2.answer3,
                        image: nil,
                        isCorrect: true
                    ),
                    Answer(
                        title: K.Texts.Quiz.Question2.answer4,
                        image: nil,
                        isCorrect: true
                    )
                ]
            ),
            
            Question(
                title: K.Texts.Quiz.Question3.question,
                answers: [
                    Answer(
                        title: K.Texts.Quiz.Question3.answer1,
                        image: nil,
                        isCorrect: false
                    ),
                    Answer(
                        title: K.Texts.Quiz.Question3.answer2,
                        image: nil,
                        isCorrect: false
                    ),
                    Answer(
                        title: K.Texts.Quiz.Question3.answer3,
                        image: nil,
                        isCorrect: true
                    ),
                    Answer(
                        title: K.Texts.Quiz.Question3.answer4,
                        image: nil,
                        isCorrect: false
                    ),
                ]
            ),
            
            Question(
                title: K.Texts.Quiz.Question4.question,
                answers: [
                    Answer(
                        title: nil,
                        image: K.Images.Balls.footBall,
                        isCorrect: false
                    ),
                    Answer(
                        title: nil,
                        image: K.Images.Balls.basketBall,
                        isCorrect: true
                    ),
                    Answer(
                        title: nil,
                        image: K.Images.Balls.volleyBall,
                        isCorrect: false
                    ),
                    Answer(
                        title: nil,
                        image: K.Images.Balls.americanBall,
                        isCorrect: false
                    ),
                ]
            ),
            
            Question(
                title: K.Texts.Quiz.Question5.question,
                answers: [
                    Answer(
                        title: K.Texts.Quiz.Question5.answer1,
                        image: nil,
                        isCorrect: false
                    ),
                    Answer(
                        title: K.Texts.Quiz.Question5.answer2,
                        image: nil,
                        isCorrect: false
                    ),
                    Answer(
                        title: K.Texts.Quiz.Question5.answer3,
                        image: nil,
                        isCorrect: true
                    ),
                    Answer(
                        title: K.Texts.Quiz.Question5.answer4,
                        image: nil,
                        isCorrect: false
                    )
                ]
            ),
            
            Question(
                title: K.Texts.Quiz.Question6.question,
                answers: [
                    Answer(
                        title: nil,
                        image: K.Images.Balls.tableTennisBall,
                        isCorrect: false
                    ),
                    Answer(
                        title: nil,
                        image: K.Images.Balls.golfBall,
                        isCorrect: false
                    ),
                    Answer(
                        title: nil,
                        image: K.Images.Balls.volleyBall,
                        isCorrect: true
                    ),
                    Answer(
                        title: nil,
                        image: K.Images.Balls.rugbyBall,
                        isCorrect: true
                    )
                ]
            ),
            
            Question(
                title: K.Texts.Quiz.Question7.question,
                answers: [
                    Answer(
                        title: K.Texts.Quiz.Question7.answer1,
                        image: nil,
                        isCorrect: false
                    ),
                    Answer(
                        title: K.Texts.Quiz.Question7.answer2,
                        image: nil,
                        isCorrect: true
                    ),
                    Answer(
                        title: K.Texts.Quiz.Question7.answer3,
                        image: nil,
                        isCorrect: false
                    ),
                    Answer(
                        title: K.Texts.Quiz.Question7.answer4,
                        image: nil,
                        isCorrect: false
                    )
                ]
            ),
            
            Question(
                title: K.Texts.Quiz.Question8.question,
                answers: [
                    Answer(
                        title: nil,
                        image: K.Images.Balls.basketBall,
                        isCorrect: false
                    ),
                    Answer(
                        title: nil,
                        image: K.Images.Balls.baseBall,
                        isCorrect: false
                    ),
                    Answer(
                        title: nil,
                        image: K.Images.Balls.tableTennisBall,
                        isCorrect: true
                    ),
                    Answer(
                        title: nil,
                        image: K.Images.Balls.golfBall,
                        isCorrect: false
                    ),
                ]
            ),
            
            Question(
                title: K.Texts.Quiz.Question9.question,
                answers: [
                    Answer(
                        title: K.Texts.Quiz.Question9.answer1,
                        image: nil,
                        isCorrect: false
                    ),
                    Answer(
                        title: K.Texts.Quiz.Question9.answer2,
                        image: nil,
                        isCorrect: false
                    ),
                    Answer(
                        title: K.Texts.Quiz.Question9.answer3,
                        image: nil,
                        isCorrect: true
                    ),
                    Answer(
                        title: K.Texts.Quiz.Question9.answer4,
                        image: nil,
                        isCorrect: false
                    )
                ]
            ),
            
            Question(
                title: K.Texts.Quiz.Question10.question,
                answers: [
                    Answer(
                        title: nil,
                        image: K.Images.Balls.basketBall,
                        isCorrect: false
                    ),
                    Answer(
                        title: nil,
                        image: K.Images.Balls.footBall,
                        isCorrect: false
                    ),
                    Answer(
                        title: nil,
                        image: K.Images.Balls.americanBall,
                        isCorrect: true
                    ),
                    Answer(
                        title: nil,
                        image: K.Images.Balls.volleyBall,
                        isCorrect: true
                    )
                ]
            ),
            
            Question(
                title: K.Texts.Quiz.Question11.question,
                answers: [
                    Answer(
                        title: K.Texts.Quiz.Question11.answer1,
                        image: nil,
                        isCorrect: false
                    ),
                    Answer(
                        title: K.Texts.Quiz.Question11.answer2,
                        image: nil,
                        isCorrect: false
                    ),
                    Answer(
                        title: K.Texts.Quiz.Question11.answer3,
                        image: nil,
                        isCorrect: true
                    ),
                    Answer(
                        title: K.Texts.Quiz.Question11.answer4,
                        image: nil,
                        isCorrect: false
                    )
                ]
            ),
            
            Question(
                title: K.Texts.Quiz.Question12.question,
                answers: [
                    Answer(
                        title: K.Texts.Quiz.Question12.answer1,
                        image: nil,
                        isCorrect: false
                    ),
                    Answer(
                        title: K.Texts.Quiz.Question12.answer2,
                        image: nil,
                        isCorrect: true
                    ),
                    Answer(
                        title: K.Texts.Quiz.Question12.answer3,
                        image: nil,
                        isCorrect: false
                    ),
                    Answer(
                        title: K.Texts.Quiz.Question12.answer4,
                        image: nil,
                        isCorrect: false
                    )
                ]
            ),
            
            Question(
                title: K.Texts.Quiz.Question13.question,
                answers: [
                    Answer(
                        title: nil,
                        image: K.Images.Balls.baseBall,
                        isCorrect: false
                    ),
                    Answer(
                        title: nil,
                        image: K.Images.Balls.rugbyBall,
                        isCorrect: false
                    ),
                    Answer(
                        title: nil,
                        image: K.Images.Balls.tableTennisBall,
                        isCorrect: true
                    ),
                    Answer(
                        title: nil,
                        image: K.Images.Balls.tennisBall,
                        isCorrect: false
                    )
                ]
            ),
            
            Question(
                title: K.Texts.Quiz.Question14.question,
                answers: [
                    Answer(
                        title: K.Texts.Quiz.Question14.answer1,
                        image: nil,
                        isCorrect: false
                    ),
                    Answer(
                        title: K.Texts.Quiz.Question14.answer2,
                        image: nil,
                        isCorrect: false
                    ),
                    Answer(
                        title: K.Texts.Quiz.Question14.answer3,
                        image: nil,
                        isCorrect: true
                    ),
                    Answer(
                        title: K.Texts.Quiz.Question14.answer4,
                        image: nil,
                        isCorrect: false
                    )
                ]
            ),
            
            Question(
                title: K.Texts.Quiz.Question15.question,
                answers: [
                    Answer(
                        title: K.Texts.Quiz.Question15.answer1,
                        image: nil,
                        isCorrect: false
                    ),
                    Answer(
                        title: K.Texts.Quiz.Question15.answer2,
                        image: nil,
                        isCorrect: false
                    ),
                    Answer(
                        title: K.Texts.Quiz.Question15.answer3,
                        image: nil,
                        isCorrect: true
                    ),
                    Answer(
                        title: K.Texts.Quiz.Question15.answer4,
                        image: nil,
                        isCorrect: false
                    )
                ]
            ),
            
            Question(
                title: K.Texts.Quiz.Question16.question,
                answers: [
                    Answer(
                        title: K.Texts.Quiz.Question16.answer1,
                        image: nil,
                        isCorrect: false
                    ),
                    Answer(
                        title: K.Texts.Quiz.Question16.answer2,
                        image: nil,
                        isCorrect: true
                    ),
                    Answer(
                        title: K.Texts.Quiz.Question16.answer3,
                        image: nil,
                        isCorrect: false
                    ),
                    Answer(
                        title: K.Texts.Quiz.Question16.answer4,
                        image: nil,
                        isCorrect: false
                    )
                ]
            ),
            
            Question(
                title: K.Texts.Quiz.Question17.question,
                answers: [
                    Answer(
                        title: nil,
                        image: K.Images.Balls.baseBall,
                        isCorrect: false
                    ),
                    Answer(
                        title: nil,
                        image: K.Images.Balls.americanBall,
                        isCorrect: false
                    ),
                    Answer(
                        title: nil,
                        image: K.Images.Balls.golfBall,
                        isCorrect: true
                    ),
                    Answer(
                        title: nil,
                        image: K.Images.Balls.rugbyBall,
                        isCorrect: false
                    )
                ]
            ),
            
            Question(
                title: K.Texts.Quiz.Question18.question,
                answers: [
                    Answer(
                        title: nil,
                        image: K.Images.Balls.basketBall,
                        isCorrect: false
                    ),
                    Answer(
                        title: nil,
                        image: K.Images.Balls.footBall,
                        isCorrect: false
                    ),
                    Answer(
                        title: nil,
                        image: K.Images.Balls.americanBall,
                        isCorrect: true
                    ),
                    Answer(
                        title: nil,
                        image: K.Images.Balls.rugbyBall,
                        isCorrect: false
                    )
                ]
            ),
            
            Question(
                title: K.Texts.Quiz.Question19.question,
                answers: [
                    Answer(
                        title: K.Texts.Quiz.Question19.answer1,
                        image: nil,
                        isCorrect: false
                    ),
                    Answer(
                        title: K.Texts.Quiz.Question19.answer2,
                        image: nil,
                        isCorrect: false
                    ),
                    Answer(
                        title: K.Texts.Quiz.Question19.answer3,
                        image: nil,
                        isCorrect: true
                    ),
                    Answer(
                        title: K.Texts.Quiz.Question19.answer4,
                        image: nil,
                        isCorrect: false
                    )
                ]
            ),
            
            Question(
                title: K.Texts.Quiz.Question20.question,
                answers: [
                    Answer(
                        title: nil,
                        image: K.Images.Balls.tennisBall,
                        isCorrect: false
                    ),
                    Answer(
                        title: nil,
                        image: K.Images.Balls.golfBall,
                        isCorrect: true
                    ),
                    Answer(
                        title: nil,
                        image: K.Images.Balls.baseBall,
                        isCorrect: false
                    ),
                    Answer(
                        title: nil,
                        image: K.Images.Balls.tableTennisBall,
                        isCorrect: false
                    )
                ]
            )
        ]
        return questions
    }
}
