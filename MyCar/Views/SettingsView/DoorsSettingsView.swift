//
//  DoorsSettingsView.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/20/24.
//

import SwiftUI

struct DoorsSettingsView: View {
    let onLockedButtonTapped: () -> Void
    let onUnlockedButtonTapped: () -> Void
    
    @Binding var doorState: SettingItemStateInterface
    
    var body: some View {
        if let doorState = doorState as? DoorStateInterface {
            HStack(spacing: 7) {
                Spacer()
                
                if doorState.state != .unlocking {
                    doorButton(
                        icon: doorState.uiFixedState.leftIcon,
                        attributes: doorState.uiFixedState,
                        foregroundColor: doorState.uiChangableState.leftButtonIconColor,
                        backgroundColor: doorState.uiChangableState.leftButtonBackground,
                        action: onLockedButtonTapped
                    )
                    .disabled(doorState.uiChangableState.leftButtonDisabled)

                } else {
                    CircularLoadingView(color: doorState.uiFixedState.circleColor,
                                        lineWidth: doorState.uiFixedState.circleWidth,
                                        frameSize: doorState.uiFixedState.buttonSize.height,
                                        animationDuration: doorState.uiFixedState.animationDuration)
                }
                
                doorButton(
                    icon: doorState.uiFixedState.rightIcon,
                    attributes: doorState.uiFixedState,
                    foregroundColor: doorState.uiChangableState.rightButtonIconColor,
                    backgroundColor: doorState.uiChangableState.rightButtonBackground,
                    action: onUnlockedButtonTapped
                )
                .disabled(doorState.uiChangableState.rightButtonDisabled)
                
                Spacer()
            }
            .padding(.vertical, doorState.uiFixedState.horizontalPadding)
            .background(doorState.uiFixedState.backgroundColor)
        }
    }
    
    private func doorButton(icon: String, attributes: DoorUIFixedAttributes, foregroundColor: Color, backgroundColor: Color, action: @escaping () -> Void) -> some View {
        self.modifier(DoorButtonModifier(icon: icon,
                                         attributes: attributes,
                                         foregroundColor: foregroundColor,
                                         backgroundColor: backgroundColor,
                                         action: action))
    }
}
