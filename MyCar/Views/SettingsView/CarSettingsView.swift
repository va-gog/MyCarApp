//
//  CarSettingView.swift
//  MyCarApp
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import SwiftUI

struct CarSettingView: View {
    
    var buttonAction: ((ButtonType) -> Void)
    let theme = CarSettingsViewTheme()
    @Binding var settings: [SettingItemUIInfoInterface]
    
    var body: some View {
        ScrollView() {
            LazyVGrid(columns: theme.columns) {
                ForEach(settings.indices, id: \.self) { index in
                    let doorState = settings[index]
                    VStack(alignment: .leading, spacing: 0) {
                        HStack() {
                            Text(doorState.title)
                                .font(.headline)
                                .padding(.leading, theme.titleLeadingPadding)
                                .fontWeight(.bold)
                            if let text = doorState.description {
                                Divider()
                                    .background(.black)
                                    .frame(width: theme.dividerWidth)
                                Text(text)
                                    .font(.system(size: theme.describeTextSize))
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                        }
                        .padding(.vertical, theme.titleVerticalPadding)
                        
                        if settings[index] is DoorItemUIInfo  {
                            doorsView(at: index)
                        }
                        
                        if settings[index] is EngineItemUIInfo {
                            engineView(at: index)
                        }
                        
                    }
                    .padding(0)
                    .shadow(color: Color.black.opacity(theme.shadowOpacity),
                            radius: theme.shadowRadius,
                            x: theme.shadowOffset.x,
                            y: theme.shadowOffset.y)
                }
            }
            .padding(.horizontal, theme.settingViewHorizontalPadding)
        }
    }
    
    private func doorsView(at index: Int) -> some View {
        DoorsSettingsView(doorState: Binding(
            get: {
                settings[index] as! DoorItemUIInfo
            },
            set: { newValue in
                settings[index] = newValue
            }
        )) {
            buttonAction(.lock)
        } onUnlockedButtonTapped: {
            buttonAction(.unlock)
        }
        .cornerRadius(theme.settingItemRadius)
    }
    
    private func engineView(at index: Int) -> some View {
        EngineSettingsView(engineState: Binding(
            get: {
                settings[index] as! EngineItemUIInfo
            },
            set: { newValue in
                settings[index] = newValue
            }
        )) {
            buttonAction(.start)
        } onStoppedButtonTapped: {
            buttonAction(.stop)
        }
        .cornerRadius(theme.settingItemRadius)
    }

}
    

