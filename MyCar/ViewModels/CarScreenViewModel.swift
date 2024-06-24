//
//  CarScreenViewModel.swift
//  BottomBar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import Foundation
import Combine
import SwiftUI

final class CarScreenViewModel: ObservableObject, CarScreenViewModelInterface {
    @Published var fetchState: FetchState = .loading
    @Published var alertViewInfo: AlertViewInfo?
    @Published var updatedTime: String?
    @Published var carDescription: CarDescriptionModel
    @Published var settingsStates: [SettingItemUIInfoInterface]
    var currentIndex = CurrentValueSubject<Int, Never>(0)

    private var fetchService: CarDataFetchServiceProtocol
    private var timerManager: TimerManagerInterface
    private var settingItemFactory: SettingItemFactoryInterface
    private var cancellables = Set<AnyCancellable>()

    init(fetchService: CarDataFetchServiceProtocol = CarDataFetchModel(fetchService: DataFetchService()), 
         timerManager: TimerManagerInterface = TimerManager(),
         carDescription: CarDescriptionModel = CarDescriptionModel(),
         settingsStates: [SettingItemUIInfoInterface] = [],
         settinItemFactory: SettingItemFactoryInterface = SettingItemFactory()) {
        self.fetchService = fetchService
        self.timerManager = timerManager
        self.settingItemFactory = settinItemFactory
        self.carDescription = carDescription
        self.settingsStates  = settingsStates
        self.setupObservers()
    }
    
    func setupWithData(_ carData: CarModel) {
        carDescription = CarDescriptionModel(name: carData.name,
                                             fuel: carData.fuel,
                                             imagesNames: carData.images)
        settingsStates = carData.settings.allSettings().compactMap({ settingItemFactory.settingForModel($0) })
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
            showAlert()
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
        changeDoorsState()
        timerManager.startTimer(prefix: 5)
    }
    
    private func lockDoors() {
        changeDoorsState()
    }
    
    private func showAlert() {
        alertViewInfo = AlertViewInfo(title: "Are you sure?",
                                      subtitle: "Please confirm that you want to lock the doors of \(carDescription.name)",
                                      apply: "Yes, Lock",
                                      cancel: "Cancel")
    }
    
    private func setupObservers() {
        timerManager.timerCompleted.sink { [weak self] ended in
            self?.changeDoorsState()
            // TODO: this value and (min, hour) must be calculated with some logic
            self?.updatedTime = "1 min"
        }.store(in: &cancellables)
    }
    
    private func changeDoorsState() {
        guard let index = settingsStates.firstIndex(where: { $0 is DoorItemUIInfo} ),
                let setting = settingsStates[index] as? DoorItemUIInfo else { return }
        switch setting.state {
        case .locked:
            settingsStates[index] = DoorItemUIInfo(state: .unlocked)
        case .unlocked:
            settingsStates[index] = DoorItemUIInfo(state: .locking)
        case .locking:
            settingsStates[index] = DoorItemUIInfo(state: .locked)
        }
    }
    
    private func changeEngineState() {
        // TODO: Implement the logic
    }
    
}
