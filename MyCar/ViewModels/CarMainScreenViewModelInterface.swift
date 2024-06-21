//
//  CarMainScreenViewModelInterface.swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/20/24.
//

import Foundation

protocol CarMainScreenViewModelInterface {
    func fetchInfoWithURL(_ url: URL?)
    func buttonAction(buttonType: ButtonType)
    func lockIfPossible()
    func unlockIfPossible()
}
