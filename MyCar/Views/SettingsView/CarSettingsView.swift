//
//  CarSettingView.swift
//  MyCarApp
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import SwiftUI

struct CarSettingView: View {
    private let columns = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    private let dividerWidth: CGFloat = 20
    private let describeTextSize: CGFloat = 12
    private let shadowOpacity: CGFloat = 0.2
    private let shadowOffset = CGPoint(x: 0, y: 2)
    private let shadowRadius: CGFloat = 5
    private let settingItemRadius: CGFloat = 5
    private let titleLeadingPadding: CGFloat = 5
    private let titleVerticalPadding: CGFloat = 5
    private let settingViewHorizontalPadding: CGFloat = 20
    
    var buttonAction: ((ButtonType) -> Void)?
    @Binding var settings: [SettingItemUIInfoInterface]
    
    var body: some View {
        ScrollView() {
            LazyVGrid(columns: columns) {
                ForEach(settings.indices, id: \.self) { index in
                    let doorState = settings[index]
                        VStack(alignment: .leading, spacing: 0) {
                            HStack() {
                                Text(doorState.title)
                                    .font(.headline)
                                    .padding(.leading, titleLeadingPadding)
                                    .fontWeight(.bold)
                                if let text = doorState.state.text {
                                    Divider()
                                        .background(.black)
                                        .frame(width: dividerWidth)
                                    Text(text)
                                        .font(.system(size: describeTextSize))
                                        .foregroundColor(.gray)
                                    
                                }
                                Spacer()
                            }
                            .padding(.vertical, titleVerticalPadding)
                            
                            SettingsButtonFactory.makeView(for: settings[index].state, buttonAction: buttonAction)
                                                    .cornerRadius(settingItemRadius)
                        }
                        .padding(0)
                        .shadow(color: Color.black.opacity(shadowOpacity),
                                radius: shadowRadius,
                                x: shadowOffset.x,
                                y: shadowOffset.y)
                }
            }
            .padding(.horizontal, settingViewHorizontalPadding)
        }
    }
}
    

