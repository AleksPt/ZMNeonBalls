import SwiftUI

struct LoaderView: View {
    var progress: CGFloat = 0.0

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            Circle()
                .stroke(lineWidth: 15)
                .frame(width: 150, height: 150)
                .foregroundStyle(.gray.opacity(0.3))
            
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    style: StrokeStyle(
                        lineWidth: 18,
                        lineCap: .round,
                        lineJoin: .round
                    )
                )
                .frame(width: 150, height: 150)
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [.cyan, .blue]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .rotationEffect(.degrees(-90))
//                .animation(.linear, value: progress)
                .overlay {
                    Text("\(Int(progress * 100))").font(.largeTitle)
//                        .animation(.default, value: progress)
                        .foregroundStyle(.white)
                }
        }
    }
}

#Preview {
    ZStack {
        Color.black
        LoaderView(progress: 0.5)
    }
    .ignoresSafeArea()
}
