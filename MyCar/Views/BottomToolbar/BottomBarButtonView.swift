//
//  BottomBarButtonView.swift
//  BottomBar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import SwiftUI

struct BottomBarButtonView: View {
    let tab: Tab
    let isSelected: Bool

    var body: some View {
        HStack(spacing: 0){
            VStack(spacing: 0){
                Image(systemName: tab.icon)
                    .resizable()
                    .frame(width: 24,height: 24)
                    .foregroundColor(isSelected ? Color(hex: 0xA66A53) : .black)
                    .padding(.top, 10)
                
                Text(tab.title)
                    .font(.caption)
                    .foregroundColor(isSelected ? Color(hex: 0xA66A53) : .black)
                    .padding(.top, 10)
            }
        }
    }
}
