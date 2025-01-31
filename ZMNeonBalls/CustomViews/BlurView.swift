import SwiftUI

struct BlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style
    var removeAllFilter: Bool = false
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        view.layer.opacity = 0.99
        return view
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        DispatchQueue.main.async {
            if let backdropLayer = uiView.layer.sublayers?.first {
                if removeAllFilter {
                    backdropLayer.filters = []
                } else {
                    backdropLayer.filters?.removeAll(where: { filter in
                        String(describing: filter) != "gaussianBlur"
                    })
                }
            }
        }
        
    }
}
