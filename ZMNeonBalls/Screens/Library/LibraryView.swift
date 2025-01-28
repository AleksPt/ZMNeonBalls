//
//  LibraryView.swift
//  ZMNeonBalls
//
//  Created by Алексей on 28.01.2025.
//

import SwiftUI

struct LibraryView: View {
    @StateObject private var libraryViewModel = LibraryViewModel()
    private let columns = [
        GridItem(.fixed(100)),
        GridItem(.fixed(100))
        ]
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                HeaderView(
                    title: K.Texts.Screens.Library.title,
                    subtitle: K.Texts.Screens.Library.subtitle
                )
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(0..<10) { index in
                            Rectangle()
                                .fill(Color.blue)
                                .frame(height: 50)
                                .overlay(
                                    Text("Ячейка \(index + 1)")
                                        .foregroundColor(.white)
                                )
                        }
                    }
                }
            }
            .padding()
        }
    }
}

struct HeaderView: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.custom(K.Fonts.montserratMedium, size: 55))
                Text(subtitle)
                    .font(.custom(K.Fonts.montserratMedium, size: 13))
            }
            .foregroundStyle(.white)
            
            Spacer()
        }
    }
}

#Preview {
    LibraryView()
}
