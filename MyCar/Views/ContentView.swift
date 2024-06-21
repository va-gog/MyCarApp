//
//  ContentView.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CarScreenViewModel(fetchService: CarDataFetchModel(fetchService: DataFetchService()), timerManager: TimerManager())
    private let carDataURL = Bundle.main.url(forResource: "CarData", withExtension: "json")
    @State private var showModal = false
    
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
                            ImagesCollectionView(viewModel: ImagePagingViewModel(images: viewModel.interfaceState.carDescription.imagesNames, pagesCount: 3,
                                                                                 currentIndex: viewModel.currentIndex),
                                                 showRefreshOverlay: $viewModel.updatedTime)
                            CarSettingView(buttonAction: { buttonType in
                                withAnimation {
                                    self.viewModel.buttonAction(buttonType: buttonType)
                                }
                            }, settings: $viewModel.interfaceState.settingsStates)
                            
                            Spacer()
                            BottomBar<Tab>(selectedTab: .home, onTab: {_ in }).background(.white)
                        }
                        if viewModel.showAlert {
                            Color.black.opacity(0.5)
                                .edgesIgnoringSafeArea(.all)
                            
                            AlertView(
                                showModal: $showModal,
                                title: "Are you sure?",
                                message: "Please confirm that you want to lock the doors of “ROGUE SPT”.",
                                leftButtonText: "Cancel",
                                rightButtonText: "Yes, Lock",
                                onLeftButton: {
                                    withAnimation {
                                        self.viewModel.showAlert = false
                                    }
                                },
                                onRightButton: {
                                    withAnimation {
                                        self.viewModel.showAlert = false
                                        viewModel.lockIfPossible()
                                    }
                                }
                            )
                            .transition(.opacity)
                            .animation(.easeInOut, value: viewModel.showAlert)
                            .zIndex(1)
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
