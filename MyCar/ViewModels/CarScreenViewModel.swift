//
//  CarScreenViewModel.swift
//  BottomBar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import Foundation
import Combine

/*
 This ViewModel is for initial setups of an initial UI.
 During initial setup this ViewModel will fetch data about a selected car.
 */
final class CarScreenViewModel: ObservableObject, CarMainScreenViewModelInterface {
    private var fetchService: CarDataFetchServiceProtocol
        
    @Published var interfaceState: CarInterfaceState
    @Published var fetchState: FetchState = .loading
    @Published var showAlert: Bool = false

    init(fetchService: CarDataFetchServiceProtocol, interfaceState: CarInterfaceState = CarInterfaceState()) {
        self.fetchService = fetchService
        self.interfaceState = interfaceState
    }
    
    func setupWithData(_ carData: CarModel) {
        interfaceState = CarInterfaceState(carDescription: CarDescriptionModel(name: carData.name,
                                                                               fuel: carData.fuel,
                                                                               imagesNames: carData.images),
                                           settingsStates: carData.settings.allSettings().compactMap({ itemModel($0) }) )
        fetchState = .finished
    }
        
    func fetchInfoWithURL(_ url: URL?) {
        guard let url else {
            fetchState = .error("Something went wrong")
            return
        }
        fetchState = .loading
        Task {
            do {
                let car = try await fetchService.fetchDataForCar(url: url)
                Task { @MainActor in
                    setupWithData(car)
                }
            } catch {
                fetchState = .error("Something went wrong")
            }
        }
    }
    
    // check solution
    func buttonAction(buttonType: ButtonType) {
        switch buttonType {
        case .unlock:
            showAlert = true
        case .lock:
            showAlert = false
        case .start:
            showAlert = true
        case .stop:
            showAlert = false

        }
    }
    
    func lockChangesAccepted() {
        
    }
    
    private func itemModel(_ model: SettingModelProtocol) -> SettingItemUIInfoInterface? {
        switch model {
        case let setting as DoorModel:
            return SettingItemUIInfo(title: setting.title,
                                 state: setting.locked ? DoorLockedState() : DoorUnlockedState())
            
        case let setting as EngineModel:
            return SettingItemUIInfo(title: setting.title,
                                 state: setting.started ? EngineStartedState() : EngineStoppedState())
            
        default:
            return nil
        }
    }
}
