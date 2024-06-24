//
//  AlertView.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/21/24.
//

import SwiftUI

struct AlertView: View {
    @Binding var showModal: Bool
    
    let title: String
    let message: String
    let leftButtonText: String
    let rightButtonText: String
    let onLeftButton: () -> Void
    let onRightButton: () -> Void
    let theme = AlertViewUITheme()
    
    var body: some View {
        VStack(spacing: theme.verticalSpaceing) {
            titleView
            
            subtitleView
            
            HStack(alignment: .center) {
                Spacer()
                alertButtonStyle(title: leftButtonText,
                                 attributes: theme.leftButtonAttributes,
                                 onAction: onLeftButton)
                alertButtonStyle(title: rightButtonText,
                                 attributes: theme.rightButtonAttributes,
                                 onAction: onRightButton)
            }
            .frame(maxWidth: .infinity, alignment: theme.alignment)
            .padding([.bottom, .trailing], theme.horizontalPadding)
        }
        .background(theme.backgroundColor)
        .cornerRadius(theme.cornerRadius)
        .shadow(radius: theme.shadowRadius)
        .padding([.leading, .trailing], theme.horizontalPadding)
    }
    
    private var titleView: some View {
        HStack {
            Text(title)
                .font(theme.titleAttributes.fontSize)
                .foregroundColor(theme.titleAttributes.textColor)
                .fontWeight(theme.titleAttributes.fontWeight)
                .multilineTextAlignment(theme.titleAttributes.textAlignment)
                .padding(.top, theme.titleAttributes.textTopPadding)
        }
        .padding(.leading, theme.titleAttributes.horizontalPadding)
        .frame(maxWidth: .infinity, alignment: theme.titleAttributes.alignment)
    }
    
    private var subtitleView: some View {
        HStack {
            Text(message)
                .font(theme.subtitleAttributes.fontSize)
                .foregroundColor(theme.subtitleAttributes.textColor)
                .multilineTextAlignment(theme.subtitleAttributes.textAlignment)
        }
        .padding(.horizontal, theme.subtitleAttributes.horizontalPadding)
        .frame(maxWidth: .infinity, alignment: theme.subtitleAttributes.alignment)
    }
    
    
    private func alertButtonStyle(title: String, attributes: AlertButtonUITheme, onAction: @escaping () -> Void) -> some View {
        self.modifier(AlertButtonModifier(attributes: attributes, title: title, onAction: onAction))
    }
}
