//
//  CarDescriptionView.swift
//  BottomBar
//
//  Created by Gohar Vardanyan on 6/19/24.
//

import SwiftUI

struct CarDescriptionView: View {
    private let car: CarDescriptionModel
    private let theme: CarDescrViewUIAttributes
    
    //TODO: localizable if needed
    private let prefix = "My"
    private let fuel = "mi"
    
    init(car: CarDescriptionModel, theme: CarDescrViewUIAttributes = CarDescrViewUIAttributes()) {
        self.car = car
        self.theme = theme
    }
    
    var body: some View {
        HStack(alignment: .center) {
            leftContainer
            divider
            rightContainer
            Spacer()
        }
        .padding(theme.containerPadding)
        .frame(height: theme.containerHeight)
    }
    
    private var leftContainer: some View {
        HStack {
            Spacer()
            Text(prefix)
                .font(theme.carModelTextFont)
            Text(car.name)
                .font(theme.carModelTextFont)
        }
        .fontWeight(theme.carNameTextWeight)
    }
    
    private var rightContainer: some View {
        HStack(spacing: 0) {
            Image(Icon.gas.iconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: theme.iconHeight)
            Text(car.fuel)
                .font(theme.carFuelTextFont)
                .fontWeight(theme.carFuelTextWeight)
            Text(fuel)
                .font(theme.carFuelTextFont)
                .fontWeight(theme.carFuelTextWeight)
            Spacer()
        }
    }
    
    private var divider: some View {
        Divider()
            .frame(width: theme.dividerSize.width,
                   height: theme.dividerSize.height)
            .background(theme.dividerColor)
    }
    
}
