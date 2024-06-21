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
    let uiAttributes = AlertViewUIAttributes()
    
    var body: some View {
        VStack(spacing: 15) {
            titleView
            
            subtitleView
            
            HStack(alignment: .center) {
                Spacer()
                alertButtonStyle(title: leftButtonText,
                                 attributes: uiAttributes.leftButtonAttributes,
                                 onAction: onLeftButton)
                alertButtonStyle(title: rightButtonText,
                                 attributes: uiAttributes.rightButtonAttributes,
                                 onAction: onRightButton)
            }
            .frame(maxWidth: .infinity, alignment: uiAttributes.alignment)
            .padding([.bottom, .trailing], uiAttributes.horizontalPadding)
        }
        .background(uiAttributes.backgroundColor)
        .cornerRadius(uiAttributes.cornerRadius)
        .shadow(radius: uiAttributes.shadowRadius)
        .padding([.leading, .trailing], uiAttributes.horizontalPadding)
    }
    
    private var titleView: some View {
        HStack {
            Text(title)
                .font(uiAttributes.titleAttributes.fontSize)
                .foregroundColor(uiAttributes.titleAttributes.textColor)
                .fontWeight(uiAttributes.titleAttributes.fontWeight)
                .multilineTextAlignment(uiAttributes.titleAttributes.textAlignment)
                .padding(.top, uiAttributes.titleAttributes.textTopPadding)
        }
        .padding(.leading, uiAttributes.titleAttributes.leadingPadding)
        .frame(maxWidth: .infinity, alignment: uiAttributes.titleAttributes.alignment)
    }
    
    private var subtitleView: some View {
        HStack {
            Text(message)
                .font(uiAttributes.subtitleAttributes.fontSize)
                .foregroundColor(uiAttributes.subtitleAttributes.textColor)
                .multilineTextAlignment(uiAttributes.subtitleAttributes.textAlignment)
        }
        .padding(.leading, uiAttributes.subtitleAttributes.leadingPadding)
        .frame(maxWidth: .infinity, alignment: uiAttributes.subtitleAttributes.alignment)
    }
    
    
    private func alertButtonStyle(title: String, attributes: AlertButtonUIAttributes, onAction: @escaping () -> Void) -> some View {
        self.modifier(AlertButtonModifier(attributes: attributes, title: title, onAction: onAction))
    }
}
