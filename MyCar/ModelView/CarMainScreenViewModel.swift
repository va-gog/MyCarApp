//
//  CarMainScreenViewModel.swift
//  BottomBar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import Foundation
import Combine

enum FetchState {
    case loading
    case finished
    case error(String)
}

final class CarInterfaceState {
     var carDescription: CarDescriptionModel
     var doorsState: DoorState
     var engineState: EngineState
     var imagePage: Int = 0
     var lastUpdateDuration: TimeInterval = 0
    
    init(carDescription: CarDescriptionModel, doorsState: DoorState, engineState: EngineState, imagePage: Int, lastUpdateDuration: TimeInterval) {
        self.carDescription = carDescription
        self.doorsState = doorsState
        self.engineState = engineState
        self.imagePage = imagePage
        self.lastUpdateDuration = lastUpdateDuration
    }
}
/*
 This ViewModel is for initial setups of an initial UI.
 During initial setup this ViewModel will fetch data about a selected car.
 If there is an abiliti to change CarModels, this changeing and
 data fetching process will be handled here.
 */

protocol CarMainScreenViewModelInterface {
    func fetchInfoWithURL(_ url: URL?)
}


final class CarMainScreenViewModel: ObservableObject, CarMainScreenViewModelInterface {
    private var fetchService: CarDataFetchServiceProtocol
    private var doorsInfoService: DoorsInfoServiceProtocol?
    private var engineInfoService: EngineInfoServiceProtocol?
    private var carInfoService: CarInfoServiceProtocol?
    
    private var cancellable: Set<AnyCancellable> = []
    
    @Published var interfaceState: CarInterfaceState?
    @Published var fetchState: FetchState = .loading
    
    init(fetchService: CarDataFetchServiceProtocol) {
        self.fetchService = fetchService
    }
    
    func setupWithData(_ carData: CarModel) {
        let doorsInfoService = DoorsInfoService(state: carData.settings.doors.locked ? DoorLockedState() : DoorUnlockedState(),
                                            loadingFinished: false,
                                            loadingDuration: 5)
        let engineInfoService = EngineInfoService(state: carData.settings.engine.started ? EngineStartedState() : EngineStoppedState())
        let carInfoService = CarInfoService()
        self.doorsInfoService = doorsInfoService
        self.engineInfoService = engineInfoService
        self.carInfoService = carInfoService
        
        interfaceState = CarInterfaceState(carDescription: CarDescriptionModel(name: carData.name,
                                                                                  fuel: carData.fuel,
                                                                                  imagesNames: carData.images),
                                              doorsState: doorsInfoService.state,
                                              engineState: engineInfoService.state,
                                              imagePage: carInfoService.selectedIndex,
                                              lastUpdateDuration: carInfoService.lastUpdatedTime)
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
}
