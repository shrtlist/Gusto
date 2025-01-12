//
//  MenuItemView.swift
//  Gusto Lunch Menu
//
//  Created by Marco Abundo on 1/11/25.
//

import SwiftUI

struct MenuItemView: View {

    let menuItem: MenuItem

    var body: some View {
        HStack {
            Text(menuItem.weekday.asString)
            Spacer()
            Text(menuItem.name)
        }
    }
}
