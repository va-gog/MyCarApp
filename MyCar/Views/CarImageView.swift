//
//  CarImageView.swift
//  BottomBar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import SwiftUI

struct ImagePagingView: View {
    let images: [String]
    @State private var currentIndex = 0
    @GestureState private var translation: CGFloat = 0

        var body: some View {
            ZStack {
                GeometryReader() { geometry in
                    HStack(spacing: 0) {
                        ForEach(0..<self.images.count, id: \.self) { index in
                            Image(self.images[index], bundle: nil)
                                .resizable()
                                .scaledToFill()
                                .frame(width: UIScreen.main.bounds.width, height: 255)
                                .clipped()
                        }
                    }
                    .frame(width: geometry.size.width * CGFloat(self.images.count), alignment: .leading)
                    .offset(x: -CGFloat(self.currentIndex) * geometry.size.width)
                    .offset(x: validTranslation(width: geometry.size.width))
                    .animation(.interactiveSpring(), value: currentIndex)
                    .gesture(
                        DragGesture().updating(self.$translation) { value, state, _ in
                            state = value.translation.width
                        }
                        .onEnded { value in
                            let offset = value.translation.width / geometry.size.width
                            let newIndex = (CGFloat(self.currentIndex) - offset).rounded()
                            self.currentIndex = min(max(Int(newIndex), 0), self.images.count - 1)
                        }
                    )
                }
                .frame(height: 255)
                .overlay(
                    PaginationView(currentIndex: currentIndex, totalImages: images.count, pageCount: 3)
                        .offset(y: -15),
                    alignment: .bottom
                )
                .overlay(
                    RefreshableView()
                        .offset(y: 12),
                    alignment: .top
                )
            }
        }
    private func validTranslation(width: CGFloat) -> CGFloat {
        if currentIndex == 0 && translation > 0 {
            return 0
        } else if currentIndex == images.count - 1 && translation < 0 {
            return 0
        } else {
            return translation
        }
    }
}
