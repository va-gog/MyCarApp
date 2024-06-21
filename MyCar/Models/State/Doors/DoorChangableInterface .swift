//
//  DoorChangableState .swift
//  MyCar
//
//  Created by Gohar Vardanyan on 6/21/24.
//

import SwiftUI

protocol DoorChangableInterface {
    var leftButtonBackground: Color { get }
    var rightButtonBackground: Color { get }
    var leftButtonIconColor: Color { get }
    var rightButtonIconColor: Color { get }
}
