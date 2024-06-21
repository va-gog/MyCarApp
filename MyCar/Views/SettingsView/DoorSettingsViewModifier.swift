//
//  EngineViewModifier.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/21/24.
//

import SwiftUI

struct DoorButtonModifier: ViewModifier {
    let icon: String
    let attributes: DoorUIFixedAttributes
    let foregroundColor: Color
    let backgroundColor: Color
    let action: () -> Void
    
    func body(content: Content) -> some View {
        Button(action: {
            action()
        }) {
            Image(icon)
                .resizable()
                .frame(width: attributes.iconSize.width,
                       height: attributes.iconSize.height)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(foregroundColor)
        }
        .frame(width: attributes.buttonSize.width,
               height: attributes.buttonSize.height)
        .background(backgroundColor)
        .clipShape(Circle())
    }
}

