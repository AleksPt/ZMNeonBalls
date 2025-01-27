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
        balls = getBalls()
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
    
    private func getBalls() -> [Ball] {
        let football = K.Texts.Balls.Football.self
        let basketball = K.Texts.Balls.Basketball.self
        let volleyball = K.Texts.Balls.Volleyball.self
        let tennisball = K.Texts.Balls.Tennisball.self
        let baseball = K.Texts.Balls.Baseball.self
        let americanball = K.Texts.Balls.Americanball.self
        let golfball = K.Texts.Balls.Golfball.self
        let rugbyball = K.Texts.Balls.Rugbyball.self
        let tabletennis = K.Texts.Balls.Tabletennis.self
        let beachball = K.Texts.Balls.Beachball.self
        
        let balls = [
            Ball(
                title: football.title,
                description: football.description,
                image: K.Images.Balls.footBall,
                info: Info(
                    country: football.country,
                    size: football.size,
                    material: football.material,
                    ballStructure: football.ballStructure,
                    characteristic: football.characteristic
                ),
                fact: football.fact,
                game: Game(
                    title: football.gameTitle,
                    description: football.gameDescription
                )
            ),
            
            Ball(
                title: basketball.title,
                description: basketball.description,
                image: K.Images.Balls.basketBall,
                info: Info(
                    country: basketball.country,
                    size: basketball.size,
                    material: basketball.material,
                    ballStructure: basketball.ballStructure,
                    characteristic: basketball.characteristic
                ),
                fact: basketball.fact,
                game: Game(
                    title: basketball.gameTitle,
                    description: basketball.gameDescription
                )
            ),
            
            Ball(
                title: volleyball.title,
                description: volleyball.description,
                image: K.Images.Balls.volleyBall,
                info: Info(
                    country: volleyball.country,
                    size: volleyball.size,
                    material: volleyball.material,
                    ballStructure: volleyball.ballStructure,
                    characteristic: volleyball.characteristic
                ),
                fact: volleyball.fact,
                game: Game(
                    title: volleyball.gameTitle,
                    description: volleyball.gameDescription
                )
            ),
            
            Ball(
                title: tennisball.title,
                description: tennisball.description,
                image: K.Images.Balls.tennisBall,
                info: Info(
                    country: tennisball.country,
                    size: tennisball.size,
                    material: tennisball.material,
                    ballStructure: tennisball.ballStructure,
                    characteristic: tennisball.characteristic
                ),
                fact: tennisball.fact,
                game: Game(
                    title: tennisball.gameTitle,
                    description: tennisball.gameDescription
                )
            ),
            
            Ball(
                title: baseball.title,
                description: baseball.description,
                image: K.Images.Balls.baseBall,
                info: Info(
                    country: baseball.country,
                    size: baseball.size,
                    material: baseball.material,
                    ballStructure: baseball.ballStructure,
                    characteristic: baseball.characteristic
                ),
                fact: baseball.fact,
                game: Game(
                    title: baseball.gameTitle,
                    description: baseball.gameDescription
                )
            ),
            
            Ball(
                title: americanball.title,
                description: americanball.description,
                image: K.Images.Balls.americanBall,
                info: Info(
                    country: americanball.country,
                    size: americanball.size,
                    material: americanball.material,
                    ballStructure: americanball.ballStructure,
                    characteristic: americanball.characteristic
                ),
                fact: americanball.fact,
                game: Game(
                    title: americanball.gameTitle,
                    description: americanball.gameDescription
                )
            ),
            
            Ball(
                title: golfball.title,
                description: golfball.description,
                image: K.Images.Balls.golfBall,
                info: Info(
                    country: golfball.country,
                    size: golfball.size,
                    material: golfball.material,
                    ballStructure: golfball.ballStructure,
                    characteristic: golfball.characteristic
                ),
                fact: golfball.fact,
                game: Game(
                    title: golfball.gameTitle,
                    description: golfball.gameDescription
                )
            ),
            
            Ball(
                title: rugbyball.title,
                description: rugbyball.description,
                image: K.Images.Balls.rugbyBall,
                info: Info(
                    country: rugbyball.country,
                    size: rugbyball.size,
                    material: rugbyball.material,
                    ballStructure: rugbyball.ballStructure,
                    characteristic: rugbyball.characteristic
                ),
                fact: rugbyball.fact,
                game: Game(
                    title: rugbyball.gameTitle,
                    description: rugbyball.gameDescription
                )
            ),
            
            Ball(
                title: tabletennis.title,
                description: tabletennis.description,
                image: K.Images.Balls.tableTennisBall,
                info: Info(
                    country: tabletennis.country,
                    size: tabletennis.size,
                    material: tabletennis.material,
                    ballStructure: tabletennis.ballStructure,
                    characteristic: tabletennis.characteristic
                ),
                fact: tabletennis.fact,
                game: Game(
                    title: tabletennis.gameTitle,
                    description: tabletennis.gameDescription
                )
            ),
            
            Ball(
                title: beachball.title,
                description: beachball.description,
                image: K.Images.Balls.beachBall,
                info: Info(
                    country: beachball.country,
                    size: beachball.size,
                    material: beachball.material,
                    ballStructure: beachball.ballStructure,
                    characteristic: beachball.characteristic
                ),
                fact: beachball.fact,
                game: Game(
                    title: beachball.gameTitle,
                    description: beachball.gameDescription
                )
            )
        ]
        
        return balls
    }
}
