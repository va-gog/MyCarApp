//
//  CarDescriptionView.swift
//  BottomBar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import SwiftUI

struct CarDescriptionView: View {
    private let car: CarDescriptionModel
    private let uiAttibutes: CarDescrViewUIAttributes
    
    //TODO: localizable if needed
    private let prefix = "My"
    private let fuel = "mi"
    
    init(car: CarDescriptionModel, styler: CarDescrViewUIAttributes = CarDescrViewUIAttributes()) {
        self.car = car
        self.uiAttibutes = styler
    }
    
    var body: some View {
        HStack(alignment: .center) {
            leftContainer
            divider
            rightContainer
            Spacer()
        }
        .padding(uiAttibutes.containerPadding)
        .frame(height: uiAttibutes.containerHeight)
    }
    
    private var leftContainer: some View {
        HStack {
            Spacer()
            Text(prefix)
                .font(uiAttibutes.carModelTextFont)
            Text(car.name)
                .font(uiAttibutes.carModelTextFont)
        }
        .fontWeight(uiAttibutes.carNameTextWeight)
    }
    
    private var rightContainer: some View {
        HStack(spacing: 0) {
            Image(Icon.gas.iconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: uiAttibutes.iconHeight)
            Text(car.fuel)
                .font(uiAttibutes.carFuelTextFont)
                .fontWeight(uiAttibutes.carFuelTextWeight)
            Text(fuel)
                .font(uiAttibutes.carFuelTextFont)
                .fontWeight(uiAttibutes.carFuelTextWeight)
            Spacer()
        }
    }
    
    private var divider: some View {
        Divider()
            .frame(width: uiAttibutes.dividerSize.width,
                   height: uiAttibutes.dividerSize.height)
            .background(uiAttibutes.dividerColor)
    }
    
}
