//
//  CarScreenViewModel.swift
//  BottomBar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import Foundation
import Combine

final class CarScreenViewModel: ObservableObject, CarScreenViewModelInterface {
    @Published var interfaceState: CarInterfaceStateInterface
    @Published var fetchState: FetchState = .loading
    @Published var alertViewInfo: AlertViewInfo?
    @Published var updatedTime: String?
    var currentIndex = CurrentValueSubject<Int, Never>(0)

    private var fetchService: CarDataFetchServiceProtocol
    private var timerManager: TimerManagerInterface
    private var settingItemFactory: SettingItemFactoryInterface
    private var cancellables = Set<AnyCancellable>()

    init(fetchService: CarDataFetchServiceProtocol, 
         timerManager: TimerManagerInterface,
         settinItemFactory: SettingItemFactoryInterface = SettingItemFactory(),
         interfaceState: CarInterfaceStateInterface = CarInterfaceState()) {
        self.fetchService = fetchService
        self.interfaceState = interfaceState
        self.settingItemFactory = settinItemFactory
        self.timerManager = timerManager
        self.setupObservers()
    }
    
    func setupWithData(_ carData: CarModel) {
        interfaceState = CarInterfaceState(carDescription: CarDescriptionModel(name: carData.name,
                                                                               fuel: carData.fuel,
                                                                               imagesNames: carData.images),
                                           settingsStates: carData.settings.allSettings().compactMap({ settingItemFactory.settingForModel($0) }) )
        fetchState = .finished
    }
        
    func fetchInfoWithURL(_ url: URL?) throws {
        guard let url else {
            throw FetchError.unknown
        }
        fetchState = .loading
        Task {
            do {
                // TODO: Car must be replace with some real info
                let car = try await fetchService.fetchDataFor("car", url: url)
                Task { @MainActor in
                    setupWithData(car)
                }
            } catch { let error = error as? FetchError
                fetchState = .error(error ?? FetchError.unknown)
            }
        }
    }
    
    func buttonAction(buttonType: ButtonType) {
        switch buttonType {
        case .unlock:
            unlockApplied()
        case .lock:
            lockDoors()
        case .start:
            changeEngineState()
        case .stop:
            changeEngineState()
        case .apply:
            unlockDoors()
        }
    }
    
    private func unlockDoors() {
        let state = interfaceState.settingsStates.first(where:{ $0.state is DoorStateInterface} )
        state?.changeState()
        timerManager.startTimer(prefix: 5)
    }
    
    private func lockDoors() {
        let state = interfaceState.settingsStates.first(where:{ $0.state is DoorStateInterface} )
        state?.changeState()
    }
    
    private func changeEngineState() {
        let state = interfaceState.settingsStates.first(where:{ $0.state is EngineStateInterface} )
        state?.changeState()
    }
    
    private func unlockApplied() {
        let state = interfaceState.settingsStates.first(where:{ $0.state is DoorStateInterface} )?
            .state as? DoorStateInterface
        alertViewInfo = AlertViewInfo(title: state?.uiFixedState.alertTitle,
                                      subtitle: "\(state?.uiFixedState.subtitle ?? "") \(interfaceState.carDescription.name)",
                                      apply: state?.uiFixedState.alertApply,
                                      cancel: state?.uiFixedState.alertCancel)
    }
    
    private func setupObservers() {
        timerManager.timerCompleted.sink { [weak self] ended in
            self?.interfaceState.settingsStates.first(where:{ $0.state is DoorStateInterface} )?.changeState()
            // TODO: this value and (min, hour) must be calculated with some logic
            self?.updatedTime = "1 min"
        }.store(in: &cancellables)
    }
    

}
