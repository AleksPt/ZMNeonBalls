import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(title)
                    .minimumScaleFactor(0.9)
                    .lineLimit(1)
                    .font(.custom(K.Fonts.montserratMedium, size: 45))
                Text(subtitle)
                    .font(.custom(K.Fonts.montserratMedium, size: 13))
            }
            .foregroundStyle(.white)
            
            Spacer()
        }
    }
}
