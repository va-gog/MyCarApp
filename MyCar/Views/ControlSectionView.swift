//
//  ControlerSectionView.swift
//  BottomBar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import SwiftUI

struct ControlSectionView: View {
    let title: String
    let stateLabel: String?
    let item: SettingItemModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text(title)
                    .font(.headline)
                    .padding(.leading, 5)
                    .fontWeight(.bold)
                Spacer()
                if let stateLabel = stateLabel {
                    Divider()
                    Text(stateLabel)
                        .font(.subheadline)
                }
            }
            .padding(.top, 5)
            .padding(.bottom, 5)
            switch item.type {
            case .doors:
                DoorsView()
                    .cornerRadius(5)
            case .engine:
                EngineView()
                    .cornerRadius(5)
            }
        }

        .padding(0)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}

struct DoorsView: View {
//    let iconName: String
//    let locked: Bool
    
    var body: some View {
        HStack(spacing: 7) {
            Spacer()
            Button(action: {
                // Button action
            }) {
                Image(Icon.locked.iconName) // Replace with your asset icon name
                    .resizable()
                    .frame(width: 40, height: 40) // Specific size for the icon
                    .aspectRatio(contentMode: .fit)
            }
            .frame(width: 65, height: 65) // Larger frame for the button
            .background(.black) // Background color for the button
            .clipShape(Circle()) // Clip the button to a circular shape
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            
            Button(action: {
                // Button action
            }) {
                Image(Icon.unlocked.iconName)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .aspectRatio(contentMode: .fit)
            }
            .frame(width: 65, height: 65)
            .background(.black)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            Spacer()
        }
        .padding(.top, 15)
        .padding(.bottom, 15)
        
        .background(Color.white)
    }
}

struct EngineView: View {
//    let iconName: String
//    let locked: Bool
    
    var body: some View {
        HStack(spacing: 7) {
            Spacer()
            
            Button(action: {
                // Button action
            }) {
                Text("START")
                    .font(.system(size: 12, weight: .medium))
                    .padding(.vertical, 0)
                    .foregroundColor(.white)
                    .frame(width: 40, height: 40)
            }
            .frame(width: 65, height: 65)
            .background(Color.black)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            
            Button(action: {
                // Button action
            }) {
                Text("STOP")
                    .font(.system(size: 12, weight: .medium))
                    .padding(.horizontal, 0)
                    .foregroundColor(.white)
                    .frame(width: 35, height: 35)
            }
            .frame(width: 65, height: 65)
            .background(Color.black)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            
            Spacer()
        }
        .padding(.top, 15)
        .padding(.bottom, 15)

        .background(Color.white)
    }
}
