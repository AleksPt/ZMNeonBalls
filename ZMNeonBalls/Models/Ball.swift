import SwiftUI

struct Ball: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let image: Image
    let info: Info
    let fact: String
    let game: Game
}

struct Info {
    let country: String
    let size: String
    let material: String
    let ballStructure: String
    let characteristic: String
}

struct Game {
    let title: String
    let description: String
}
