//
//  Constants.swift
//  ZMNeonBalls
//
//  Created by Алексей on 27.01.2025.
//

import SwiftUI

enum K {
    
    // MARK: - Text
    enum Texts {
        enum Buttons {
            static let read: String = "Read"
            static let back: String = "Back"
            static let next: String = "Next"
            static let menu: String = "Menu"
        }
        
        enum Achievements {
            static let speedrun: String = "SPEEDRUN"
            static let connoisseur: String = "CONNOISSEUR"
            static let combo: String = "COMBO"
        }
        
        enum Screens {
            enum Splash {
                static let loading: String = "Loading..."
            }
            
            enum Menu {
                static let title: String = "Menu"
                static let subtitle: String = "welcome game"
                
                static let read: String = "read"
                static let play: String = "play"
                static let record: String = "record"
                
                static let infoTitle: String = "Info"
                static let infoDescription: String = "Get familiar with the balls and test your knowledge"
                
                static let testTitle: String = "Test"
                static let testDescription: String = "check your knowledge and take the test"
                
                static let resultsTitle: String = "Results"
            }
            
            enum Library {
                static let title: String = "Library"
                static let subtitle: String = "Choose a ball and find out everything about it"
            }
            
            enum BallDetailCard {
                enum Info {
                    static let info: String = "info"
                    static let country: String = "Country"
                    static let countryDetail: String = "Where it appeared"
                    static let size: String = "Size"
                    static let materialsTitle: String = "Materials"
                    static let materialsDescription: String = "find out what the ball is made of"
                    static let ballStructure: String = "Ball structure"
                    static let characteristic: String = "Characteristics features"
                }
                
                enum Fact {
                    static let fact: String = "fact"
                    static let factDetailTitle: String = "Interesting fact"
                }
                
                enum Game {
                    static let game: String = "game"
                    static let aboutGame: String = "briefly about the game"
                }
            }
            
            enum Quiz {
                static let questionTitle: String = "Question"
                static let questionSubtitle: String = "Science Quiz"
                static let gameOver: String = "Game Over!"
                static let result: String = "Result"
                static let newRecords: String = "new records"
            }
        }
        
        enum Balls {
            enum Football {
                static let title: String = "Football"
                static let description: String = "form in the middle of the 19th century"
                static let country: String = "England, as a result of the standardization of football rule"
                static let size: String = "Standard size 5\n(circumference 68-70 cm)"
                static let material: String = "leather (formerly) or synthetic\nleather (polyurethane, PVC)"
                static let ballStructure: String = "Spherical shape, consists of 32 stitched or glued panels (12 pentagons and 20 hexagons)"
                static let characteristic: String = "Suitable for kicks, provides accurate rebound, weather-resistant"
                static let fact: String = "the design of 32 panels (the so-called \"buckyball\") was designed to ensure the maximum round shape and aerodynamic stability"
                static let gameTitle: String = "Football"
                static let gameDescription: String = "Football is a team sport in which two teams of 11 players each strive to score a goal against an opponent using their legs, head, and other body parts (except their arms). It is one of the most popular sports in the world"
            }
            
            enum Basketball {
                static let title: String = "Basketball"
                static let description: String = "at the end of the 19th century (1894)"
                static let country: String = "In the USA, developed by James Naismith"
                static let size: String = "Standard size 7\n(circumference 75-78 cm)"
                static let material: String = "Leather or synthetic leather"
                static let ballStructure: String = "Spherical shape with raised channels for improved grip"
                static let characteristic: String = "Good bounce, comfortable to grip with your hands, quite hard"
                static let fact: String = "The first basketballs were made of stitched leather panels and looked more like soccer balls, and grooves appeared later for a better grip"
                static let gameTitle: String = "Basketball"
                static let gameDescription: String = "Basketball is a team sport in which two teams of 5 players try to throw the ball into the opponent's basket using their hands and dribbling. The game is dynamic and requires precision and coordination"
            }
            
            enum Volleyball {
                static let title: String = "Volleyball"
                static let description: String = "at the end of the 19th century (1895)"
                static let country: String = "SA, designed by William Morgan"
                static let size: String = "Standard size 5\n(circumference 65-67 cm)"
                static let material: String = "Leather or synthetic leather"
                static let ballStructure: String = "Spherical shape with 18 panels stitched together"
                static let characteristic: String = "Light, soft, designed for punches, should not bounce strongly"
                static let fact: String = "previously, volleyballs were sewn from leather and had an inner chamber, like soccer balls"
                static let gameTitle: String = "Volleyball"
                static let gameDescription: String = "Volleyball is a team sport in which two teams of 6 players try to throw the ball over the net so that it touches the ground on the opponent's court. The game requires jumping skills and good reflexes"
            }
            
            enum Tennisball {
                static let title: String = "Tennis ball"
                static let description: String = "mid-19th century (modern standard)"
                static let country: String = "England"
                static let size: String = "6.54-6.86 cm"
                static let material: String = "Rubber covered with fleecy felt"
                static let ballStructure: String = "Spherical shape"
                static let characteristic: String = "Excellent bounce, aerodynamic properties, yellow color for better visibility"
                static let fact: String = "The yellow color of tennis balls has become the standard for better visibility on the TV screen"
                static let gameTitle: String = "Tennis"
                static let gameDescription: String = "Tennis is a sport in which two players (singles) or two teams of two players (doubles) throw a ball over the net using a racket. The goal is to prevent the opponent from hitting the ball"
            }
            
            enum Baseball {
                static let title: String = "Baseball"
                static let description: String = "the middle of the 19th century"
                static let country: String = "USA"
                static let size: String = "7.3-7.6cm"
                static let material: String = "Leather with cork or rubber filler, stitched with red threads"
                static let ballStructure: String = "Spherical shape, sewn from two parts"
                static let characteristic: String = "Hard, designed to hit with a bat, should not bounce well"
                static let fact: String = "The seams on the baseball play an important role, allowing the ball to fly along a curved trajectory."
                static let gameTitle: String = "Baseball"
                static let gameDescription: String = "Baseball is a team sport in which two teams of 9 players compete in hitting the ball with a bat and running the bases"
            }
            
            enum Americanball {
                static let title: String = "American ball"
                static let description: String = "19th century"
                static let country: String = "USA"
                static let size: String = "Ellipsoid shape, about 28 cm in length"
                static let material: String = "Leather or synthetic leather"
                static let ballStructure: String = "Oval, with pointed ends and lacing for grip"
                static let characteristic: String = "Ellipsoid shape for throwing and grabbing, durable"
                static let fact: String = "American football balls were made from inflated pig bladders, hence his nickname \"pigskin\". Used in: American football"
                static let gameTitle: String = "American football"
                static let gameDescription: String = "American football is a team sport in which two teams of 11 players each try to propel the ball across the field and bring it into the opponent's scoring zone."
            }
            
            enum Golfball {
                static let title: String = "Golf ball"
                static let description: String = "The end of the 19th century (modern version)"
                static let country: String = "Scotland"
                static let size: String = "Diameter about 42.67mm"
                static let material: String = "Various materials, for example, rubber, ionomer, urethane"
                static let ballStructure: String = "Spherical shape with dimples on the surface to improve aerodynamics"
                static let characteristic: String = "Flight range, accuracy, aerodynamic properties"
                static let fact: String = "The indentations on the surface of the golf ball significantly increase the range and accuracy of its flight, creating aerodynamic advantages"
                static let gameTitle: String = "Golf"
                static let gameDescription: String = "Briefly about the game: Golf is an individual or team sport in which players try to roll the ball into the holes on the course in the minimum number of strokes"
            }
            
            enum Rugbyball {
                static let title: String = "Rugby ball"
                static let description: String = "19th century"
                static let country: String = "England"
                static let size: String = "Ellipsoid shape, about 28-30 cm in length"
                static let material: String = "Leather or synthetic leather"
                static let ballStructure: String = "Oval, with lacing for grip"
                static let characteristic: String = "Ellipsoid shape for throwing and grabbing, durable"
                static let fact: String = "The first rugby balls, as well as for American football, were made from inflated pig bladders"
                static let gameTitle: String = "Rugby"
                static let gameDescription: String = "Rugby is a team sport in which two teams of 15 players try to move the ball into the opponent's scoring zone using their hands and feet"
            }
            
            enum Tabletennis {
                static let title: String = "Table tennis"
                static let description: String = "The end of the 19th century"
                static let country: String = "England"
                static let size: String = "Diameter 40 mm"
                static let material: String = "Celluloid or plastic"
                static let ballStructure: String = "Spherical shape, hollow inside"
                static let characteristic: String = "Very light, with good bounce"
                static let fact: String = "Previously, table tennis balls were made of celluloid, which was flammable, but now they are made of plastic"
                static let gameTitle: String = "Table tennis"
                static let gameDescription: String = "Table tennis is a sport in which two players throw a ball over a net on a table using rackets. The goal is to prevent the ball from bouncing on your side of the table more than once"
            }
            
            enum Beachball {
                static let title: String = "Beach ball"
                static let description: String = "20th century"
                static let country: String = "California, USA"
                static let size: String = "Standard size 5 (circumference 66-68 cm)"
                static let material: String = "Synthetic leather"
                static let ballStructure: String = "Spherical shape with 18 panels stitched together"
                static let characteristic: String = "Lightweight, soft, bright design, suitable for playing in the sand"
                static let fact: String = "Beach volleyball balls are usually brightly designed to be more visible on the sand and in bright sunlight"
                static let gameTitle: String = "Beach volleyball"
                static let gameDescription: String = "Beach volleyball is a sport in which two teams of 2 players play on the sand, throwing the ball over the net, as in regular volleyball"
            }
        }
        
        enum Quiz {
            enum Question1 {
                static let question: String = "Which ball has a standard size of 5 and consists of 32 panels (12 pentagons and 20 hexagons)?"
            }
            
            enum Question2 {
                static let question: String = "In which country was the modern soccer ball standard developed?"
                static let answer1: String = "USA"
                static let answer2: String = "China"
                static let answer3: String = "England"
                static let answer4: String = "Scotland"
            }
            
            enum Question3 {
                static let question: String = "What is the most commonly used material for making modern soccer balls?"
                static let answer1: String = "Genuine leather"
                static let answer2: String = "Rubber"
                static let answer3: String = "Synthetic leather"
                static let answer4: String = "Wool"
            }
            
            enum Question4 {
                static let question: String = "Which ball was designed by James Naismith?"
            }
            
            enum Question5 {
                static let question: String = "What is the standard size of a men's basketball?"
                static let answer1: String = "65-67 cm"
                static let answer2: String = "68-70 cm"
                static let answer3: String = "75-78 cm"
                static let answer4: String = "42.67 mm"
            }
            
            enum Question6 {
                static let question: String = "Which ball was invented by William Morgan? "
            }
            
            enum Question7 {
                static let question: String = "How many panels does a volleyball usually have?"
                static let answer1: String = "12"
                static let answer2: String = "18"
                static let answer3: String = "32"
                static let answer4: String = "20"
            }
            
            enum Question8 {
                static let question: String = "Which ball is covered with fleecy felt?"
            }
            
            enum Question9 {
                static let question: String = "What kind of sport uses a ball consisting of two stitched parts?"
                static let answer1: String = "Tennis"
                static let answer2: String = "Golf"
                static let answer3: String = "Baseball"
                static let answer4: String = "Rugby"
            }
            
            enum Question10 {
                static let question: String = "Which ball has an ellipsoid shape and lacing for a better grip?"
            }
            
            enum Question11 {
                static let question: String = "In which country did golf originate?"
                static let answer1: String = "USA"
                static let answer2: String = "England"
                static let answer3: String = "Scotland"
                static let answer4: String = "Australia"
            }
            
            enum Question12 {
                static let question: String = "What is the approximate length of an American football ball?"
                static let answer1: String = "20 cm"
                static let answer2: String = "28 cm"
                static let answer3: String = "35 cm"
                static let answer4: String = "40 cm"
            }
            
            enum Question13 {
                static let question: String = " Which ball is very light and bounces well?"
            }
            
            enum Question14 {
                static let question: String = "What kind of material used to make table tennis balls?"
                static let answer1: String = "Rubber"
                static let answer2: String = "Plastic"
                static let answer3: String = "Celluloid"
                static let answer4: String = "Skin"
            }
            
            enum Question15 {
                static let question: String = "Where did beach volleyball first appear?"
                static let answer1: String = "in England"
                static let answer2: String = "in Scotland"
                static let answer3: String = "in California, USA"
                static let answer4: String = "in China"
            }
            
            enum Question16 {
                static let question: String = "What is the standard size of a beach volleyball ball?"
                static let answer1: String = "65-67 cm"
                static let answer2: String = "66-68 cm"
                static let answer3: String = "75-78 cm"
                static let answer4: String = "70-72 cm"
            }
            
            enum Question17 {
                static let question: String = " Which ball is designed for a game in which players try to drive the ball into the holes with the least number of strokes?"
            }
            
            enum Question18 {
                static let question: String = "Which ball has an oval shape with sharp ends and lacing?"
                
            }
            
            enum Question19 {
                static let question: String = "In which sport do players hit the ball with a bat and run around the bases?"
                static let answer1: String = "Golf"
                static let answer2: String = "Rugby"
                static let answer3: String = "Baseball"
                static let answer4: String = "Volleyball"
            }
            
            enum Question20 {
                static let question: String = "Which ball has a diameter of 42.67 mm?"
            }
        }
    }
    
    // MARK: - Colors
    enum Colors {
        static let color2A1C2E = Color("2A1C2E")
        static let color6F0DBD = Color("6F0DBD")
        static let color7E35CD = Color("7E35CD")
        static let color9D35CD = Color("9D35CD")
        static let color423AB9 = Color("423AB9")
        static let color463AB9 = Color("463AB9")
        static let color580A9C = Color("580A9C")
        static let colorB446E7 = Color("B446E7")
        static let colorE160BA = Color("E160BA")
    }
    
    // MARK: - Images
    enum Images {
        static let background = Image("appBackground")
        static let gameOver = Image("gameOver")
        static let star = Image("gameOverStar")
        
        enum Menu {
            static let info = Image("menuInfoBackgroundCard")
            static let results = Image("menuResultsBackgroundCard")
            static let test = Image("menuTestBackgroundCard")
        }
        
        enum Balls {
            static let americanBall = Image("americanBall")
            static let baseBall = Image("baseBall")
            static let basketBall = Image("basketBall")
            static let beachBall = Image("beachBall")
            static let footBall = Image("footBall")
            static let golfBall = Image("golfBall")
            static let rugbyBall = Image("rugbyBall")
            static let tableTennisBall = Image("tableTennisBall")
            static let tennisBall = Image("tennisBall")
            static let volleyBall = Image("volleyBall")
        }
        
        enum DetailBall {
            static let characteristic = Image("characteristicFeaturesCardBackround")
            static let gameAbout = Image("gameAboutCardBackground")
            static let gameCard = Image("gameCardBackground")
            static let fact = Image("intrestingFactCardBackground")
            static let material = Image("materialsCardBackground")
            static let size = Image("sizeCardBackground")
        }
    }
}
