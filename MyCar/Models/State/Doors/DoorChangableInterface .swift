//
//  DoorChangableState .swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/21/24.
//

import SwiftUI

protocol DoorChangableInterface {
    var leftButtonDisabled: Bool { get }
    var leftButtonBackground: Color { get }
    var leftButtonIconColor: Color { get }

    var rightButtonDisabled: Bool { get }
    var rightButtonBackground: Color { get }
    var rightButtonIconColor: Color { get }
}
