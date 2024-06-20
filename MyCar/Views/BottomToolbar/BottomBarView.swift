//
//  BottomBar.swift
//  MyCarApp
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import SwiftUI

struct BottomBar: View {
    @State private var selectedTab: Tab = .home
    @State private var selectedRect: CGRect = .zero
    
    var body: some View {
        HStack(spacing: 40) {
            Spacer()
            
            ForEach(Tab.allCases, id: \.self) { tab in
                tabButton(for: tab)
            }
            
            Spacer()
        }
        .padding(.top, 10)
        .background(Color.white)
        .overlay(
            selectedTabIndicator,
            alignment: .bottomLeading
        )
    }
    
    private func tabButton(for tab: Tab) -> some View {
        Button(action: {
            withAnimation {
                selectedTab = tab
            }
        }) {
            VStack {
                Image(systemName: tab.icon)
                    .resizable()
                    .frame(width: 24, height: 24)
                Text(tab.title)
                    .font(.caption)
                    .padding(.top, 4)
            }
            .padding(.top, 4)
            .foregroundColor(selectedTab == tab ? Color(hex: ProjectColorSpecs.lightBrown) : .black)
            .background(GeometryReader { geometry in
                Color.clear
                    .onAppear { updateSelectedRect(for: tab, with: geometry) }
                    .onChange(of: selectedTab) { oldValue, newValue in
                        updateSelectedRect(for: tab, with: geometry)
                    }
            })
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    private var selectedTabIndicator: some View {
        GeometryReader { geometry in
            Rectangle()
                .frame(width: selectedRect.width, height: 2)
                .foregroundColor(Color(hex: 0xA66A53))
                .position(x: selectedRect.midX - geometry.frame(in: .global).minX, y: 0)
                .animation(.easeInOut(duration: 0.3), value: selectedRect)
        }
    }
    
    private func updateSelectedRect(for tab: Tab, with geometry: GeometryProxy) {
        if selectedTab == tab {
            selectedRect = geometry.frame(in: .global)
        }
    }
}
