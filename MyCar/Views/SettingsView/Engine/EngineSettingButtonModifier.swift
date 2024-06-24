//
//  EngineSettingButtonModifier.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/21/24.
//

import SwiftUI

struct EngineSettingButtonModifier: ViewModifier {
    let title: String
    let theme: EngineButtonTheme
    let foregroundColor: Color
    let backgroundColor: Color
    let action: () -> Void
    
    func body(content: Content) -> some View {
        Button(action: {
            action()
        }) {
            Text(title)
                .font(theme.font)
                .frame(width: theme.textSize.width,
                       height: theme.textSize.height)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(foregroundColor)
        }
        .frame(width: theme.buttonSize.width,
               height: theme.buttonSize.height)
        .background(backgroundColor)
        .clipShape(Circle())
        
    }
}
