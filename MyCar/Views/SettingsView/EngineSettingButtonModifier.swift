//
//  EngineSettingButtonModifier.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/21/24.
//

import SwiftUI

struct EngineSettingButtonModifier: ViewModifier {
    let title: String
    let attributes: EngineUIFixedAttributes
    let foregroundColor: Color
    let backgroundColor: Color
    let action: () -> Void
    
    func body(content: Content) -> some View {
        Button(action: {
            action()
        }) {
            Text(title)
                .font(attributes.font)
                .frame(width: attributes.textSize.width,
                       height: attributes.textSize.height)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(foregroundColor)
        }
        .frame(width: attributes.buttonSize.width,
               height: attributes.buttonSize.height)
        .background(backgroundColor)
        .clipShape(Circle())
        
    }
}
