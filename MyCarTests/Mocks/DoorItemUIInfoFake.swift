//
//  DoorItemUIInfoFake.swift
//  MyCarTests
//
//  Created by Gohar Vardanyan on 6/24/24.
//

@testable import MyCar

struct DoorItemUIInfo: SettingItemUIInfoInterface {
    var title: String = "Doors"
    var description: String? = ""
    var state: DoorState = .locked
    var uiChangableState: DoorUIChangableTheme = DoorUIChangableTheme(leftButtonDisabled: true,
                                                                      leftButtonBackground: HexColorSpec,
                                                                      leftButtonIconColor: <#T##Color#>,
                                                                      rightButtonDisabled: <#T##Bool#>,
                                                                      rightButtonBackground: <#T##Color#>,
                                                                      rightButtonIconColor: <#T##Color#>)

}

