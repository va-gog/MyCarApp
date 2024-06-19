//
//  ContentView.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import SwiftUI

struct Car: Identifiable {
    var id = UUID()
    var name: String
    var fuel: String
    var doorsLocked: Bool
    var lastUpdated: String
    var location: String
    var alerts: Int
    var messages: Int
}

struct ContentView: View {
    @StateObject private var viewModel = CarMainScreenViewModel(fetchService: CarDataFetchModel(fetchService: DataFetchService()))
       private let carDataURL = Bundle.main.url(forResource: "CarData", withExtension: "json") 

        
    var body: some View {
        ZStack(alignment: .top, content: {
            switch viewModel.fetchState {
            case .loading:
                ProgressView("Loading...")
            case .finished:
                Color.gray.opacity(0.5)
                    .overlay {
                        VStack(spacing: 0) {
                            CarInfoDescriptionView(car: viewModel.interfaceState!.carDescription,
                                                   styler: CarDescriptionViewStyle())
                            .background(.white)
                            ImagePagingView(images: viewModel.interfaceState!.carDescription.imagesNames)
                            CarSettingView()
                            Spacer()
                            BottomBar().background(.white)
                        }
                    }
            case .error(let message):
                Text(message)
                    .foregroundColor(.red)
            }
        })
        .onAppear {
            viewModel.fetchInfoWithURL(carDataURL)
        }
            
                     
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
