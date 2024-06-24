//
//  DoorsSettingsView.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/20/24.
//

import SwiftUI

struct DoorsSettingsView: View {
    @Binding var doorState: DoorItemUIInfo

    let onLockedButtonTapped: () -> Void
    let onUnlockedButtonTapped: () -> Void
    
    let theme = DoorUIFixedTheme ()
        
    var body: some View {
            HStack(spacing: 7) {
                Spacer()
                
                if doorState.state != .locking {
                    doorButton(
                        icon: theme.leftIcon,
                        theme: theme.butonTheme,
                        foregroundColor: doorState.uiChangableState.leftButtonIconColor,
                        backgroundColor: doorState.uiChangableState.leftButtonBackground,
                        action: onLockedButtonTapped
                    )
                    .disabled(doorState.uiChangableState.leftButtonDisabled)

                } else {
                    CircularLoadingView(color: theme.circleColor,
                                        lineWidth: theme.circleWidth,
                                        frameSize: theme.butonTheme.buttonSize.height,
                                        animationDuration: theme.animationDuration)
                }
                
                doorButton(
                    icon: theme.rightIcon,
                    theme: theme.butonTheme,
                    foregroundColor: doorState.uiChangableState.rightButtonIconColor,
                    backgroundColor: doorState.uiChangableState.rightButtonBackground,
                    action: onUnlockedButtonTapped
                )
                .disabled(doorState.uiChangableState.rightButtonDisabled)
                
                Spacer()
            }
            .padding(.vertical, theme.horizontalPadding)
            .background(theme.backgroundColor)
    }
    
    private func doorButton(icon: String, theme: DoorButtonTheme, foregroundColor: Color, backgroundColor: Color, action: @escaping () -> Void) -> some View {
        self.modifier(DoorButtonModifier(icon: icon,
                                         theme: theme,
                                         foregroundColor: foregroundColor,
                                         backgroundColor: backgroundColor,
                                         action: action))
    }
}
