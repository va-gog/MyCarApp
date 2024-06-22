//
//  TimerManagerInterface.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/22/24.
//

import Combine

protocol TimerManagerInterface {
    var timerCompleted: PassthroughSubject<Bool, Never> { get }
    func startTimer(prefix: Int)
}
