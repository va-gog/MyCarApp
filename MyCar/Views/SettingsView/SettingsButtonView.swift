//
//  SettingsButtonView.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/20/24.
//

import SwiftUI

struct CustomButtonView<Content: View>: View {
    let content: Content
    let action: () -> Void
    
    init(@ViewBuilder content: () -> Content, action: @escaping () -> Void) {
        self.content = content()
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            content
                .frame(width: 40, height: 40)
                .aspectRatio(contentMode: .fit)
        }
        .frame(width: 65, height: 65)
        .background(Color.black)
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.white, lineWidth: 2))
    }
}

