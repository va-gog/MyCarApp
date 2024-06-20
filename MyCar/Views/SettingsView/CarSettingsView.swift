//
//  CarSettingView.swift
//  MyCarApp
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import SwiftUI

struct CarSettingView: View {
    let columns = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
//    @Binding var doorState: SettingItemUIInfoInterface
    var buttonAction: ((ButtonType) -> Void)?
    @Binding var settings: [SettingItemUIInfoInterface]
    
    var body: some View {
        ScrollView() {
            LazyVGrid(columns: columns) {
                ForEach(settings.indices, id: \.self) { index in
                    let doorState = settings[index]
                    VStack(spacing: 0) {
                        VStack(alignment: .leading, spacing: 0) {
                            HStack() {
                                Text(doorState.title)
                                    .font(.headline)
                                    .padding(.leading, 5)
                                    .fontWeight(.bold)
                                Divider()
                                Text(doorState.state.text)
                                    .font(.system(size: 12))
                                    .foregroundColor(.gray)
                                
                                
                                Spacer()
                            }
                            .padding(.top, 5)
                            .padding(.bottom, 5)
                            
                            if  settings[index].state is DoorStateInterface  {
                                
                                DoorsSettingsView(onLockedButtonTapped: {
                                    self.buttonAction?(.lock)
                                }, onUnlockedButtonTapped: {
                                    self.buttonAction?(.unlock)
                                    
                                }, doorState: $settings[index].state)
                                
                            }
                            if  settings[index].state is EngineStateInterface {
                                EngineSettingsView(onStartedButtonTapped: {
                                    self.buttonAction?(.start)
                                }, onStoppedButtonTapped: {
                                    self.buttonAction?(.stop)
                                }, engineState: $settings[index].state)
                                .cornerRadius(5)
                            }
                        }
                        
                        .padding(0)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                    }
                }
            }
            .padding(.horizontal, 20)
        }
        
    }
    
}
    

