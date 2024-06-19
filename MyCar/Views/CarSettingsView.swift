//
//  CarSettingView.swift
//  MyCarApp
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import SwiftUI

struct CarSettingView: View {
    @ObservedObject var dataFetcher = DataFetcher()
    
    let columns = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    var body: some View {
        ScrollView() {
            LazyVGrid(columns: columns) {
                ForEach(dataFetcher.items) { item in
                    VStack(spacing: 0) {
                        ControlSectionView(
                            title: "Doors",
                            stateLabel: nil, item: item
                        )
                    }
                }
            }
            .padding(.horizontal, 20)
        }
    }
}
    
    class DataFetcher: ObservableObject {
        @Published var items: [SettingItemModel] = []
        
        init() {
            fetchData()
        }
        
        func fetchData() {
            items = [
                SettingItemModel(type: .doors, content: "Content for Type A"),
                SettingItemModel(type: .engine, content: "Content for Type B")
            ]
        }
    }
    
    struct SettingItemModel: Identifiable, Hashable {
        let id = UUID()
        let type: Setting
        let content: String
    }
    
    enum Setting {
        case doors
        case engine
    }
    

