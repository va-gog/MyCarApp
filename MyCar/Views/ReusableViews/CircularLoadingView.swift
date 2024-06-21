//
//  CircularLoadingView.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/20/24.
//

import SwiftUI

struct CircularLoadingView: View {
    @State private var isAnimating = false

    let color: Color
    let lineWidth: CGFloat
    let frameSize: CGFloat
    let animationDuration: CGFloat
    
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0.0, to: 0.75)
                .stroke(color, lineWidth: lineWidth)
                .frame(width: frameSize, height: frameSize)
                .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
                .animation(Animation.linear(duration: animationDuration).repeatForever(autoreverses: false), value: isAnimating)
                .onAppear {
                    self.isAnimating = true
                }
        }
    }
}
