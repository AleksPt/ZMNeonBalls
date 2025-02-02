import SwiftUI

struct SelectTabButton: View {
    enum Direction {
        case left, right
    }
    
    let direction: Direction
    let action: ()->()
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                Circle()
                    .background(.ultraThinMaterial)
                    .clipShape(Circle())
                    .foregroundStyle(K.Colors.color7E35CD)
                    .opacity(0.6)
                    .frame(width: 45)
                    .overlay {
                        switch direction {
                        case .left:
                            K.Images.arrowLeft
                                .scaleEffect(0.25)
                                .offset(x: -1.5)
                        case .right:
                            K.Images.arrowLeft
                                .scaleEffect(0.25)
                                .offset(x: -1.5)
                                .rotationEffect(.degrees(180))
                        }
                    }
            }
        }
    }
}
