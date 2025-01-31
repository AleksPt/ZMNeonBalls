import SwiftUI

struct CircleButtonView: View {
    let width: CGFloat
    let scale: CGFloat
    let action: () -> ()
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                Circle()
                    .frame(width: width)
                    .overlay {
                        K.Images.arrow
                            .scaleEffect(scale)
                    }
            }
            .padding(.leading)
        }
        .offset(y: 5)
    }
}

