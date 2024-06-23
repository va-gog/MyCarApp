//
//  CircularLoadingView.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/20/24.
//

import SwiftUI

struct CircularLoadingView: View {
    @State private var isAnimating = false

    var color: Color
    var lineWidth: CGFloat
    var frameSize: CGFloat
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .edgesIgnoringSafeArea(.all)
            
            Circle()
                .trim(from: 0.0, to: 0.75)
                .stroke(color, lineWidth: lineWidth)
                .frame(width: frameSize, height: frameSize)
                .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false), value: isAnimating)
                .onAppear {
                    self.isAnimating = true
                }
        }
    }
}
