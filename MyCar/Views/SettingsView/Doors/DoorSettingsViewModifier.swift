//
//  EngineViewModifier.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/21/24.
//

import SwiftUI

struct DoorButtonModifier: ViewModifier {
    let icon: String
    let theme: DoorButtonTheme
    let foregroundColor: Color
    let backgroundColor: Color
    let action: () -> Void
    
    func body(content: Content) -> some View {
        Button(action: {
            action()
        }) {
            Image(icon)
                .resizable()
                .frame(width: theme.iconSize.width,
                       height: theme.iconSize.height)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(foregroundColor)
        }
        .frame(width: theme.buttonSize.width,
               height: theme.buttonSize.height)
        .background(backgroundColor)
        .clipShape(Circle())
    }
}

