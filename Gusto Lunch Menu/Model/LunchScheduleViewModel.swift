//
//  LunchScheduleViewModel.swift
//  Gusto Lunch Menu
//
//  Created by Marco Abundo on 7/26/24.
//

import Foundation

@MainActor
class LunchScheduleViewModel: ObservableObject {
    @Published var weeklyMenus = [WeeklyMenu]()

    private let lunchMenuDataSource = LunchMenuDataSource()

    func fetchLunchMenu() async {
        let apiResult = await lunchMenuDataSource.getLunchMenu()

        for (index, menuItems) in apiResult.enumerated() {
            weeklyMenus.append(WeeklyMenu(id: index, menuItems: menuItems))
        }
    }
}
