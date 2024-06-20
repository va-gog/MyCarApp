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
    @StateObject private var viewModel = CarScreenViewModel(fetchService: CarDataFetchModel(fetchService: DataFetchService()))
    private let carDataURL = Bundle.main.url(forResource: "CarData", withExtension: "json")
    
    var body: some View {
        ZStack(alignment: .top, content: {
            switch viewModel.fetchState {
            case .loading:
                ProgressView("Loading...")
            case .finished:
                Color.init(hex: 0xE5E5E5).opacity(0.5)
                    .overlay {
                        VStack(spacing: 0) {
                            CarDescriptionView(car: viewModel.interfaceState.carDescription)
                                .background(.white)
                            ImagesCollectionView(viewModel: ImagePagingViewModel(images: viewModel.interfaceState.carDescription.imagesNames))
                            CarSettingView(buttonAction: { buttonType in
                                self.viewModel.buttonAction(buttonType: buttonType)

                            }, settings: $viewModel.interfaceState.settingsStates)
                                    
                            Spacer()
                            BottomBar().background(.white)
                        }
                        .alert(isPresented: $viewModel.showAlert) {
                                    Alert(
                                        title: Text("Are you sure?"),
                                        message: Text("Please confirm that you want to lock the doors of “ROGUE SPT”."),
                                        primaryButton: .default(Text("Yes, Lock")) {
                                            // Action for locking the doors
                                            print("Locking the doors")
                                        },
                                        secondaryButton: .cancel()
                                    )
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
