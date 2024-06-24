//
//  AlertButtonModifier.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/21/24.
//

import SwiftUI

struct AlertButtonModifier: ViewModifier {
    var attributes: AlertButtonUITheme
    var title: String
    var onAction: () -> Void
    
    func body(content: Content) -> some View {
        Button(action: onAction) {
            Text(title)
                .font(attributes.textSize)
                .foregroundColor(attributes.textForegroundColor)
                .padding([.leading, .trailing], attributes.textHorizontalPadding)
        }
        .frame(height: attributes.buttonHeight)
        .background(attributes.background)
        .cornerRadius(attributes.cornerRadius)
        .padding(.leading, attributes.leftPadding)
        
    }
}
