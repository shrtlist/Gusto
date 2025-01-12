//
//  LunchScheduleViewModel.swift
//  Gusto Lunch Menu
//
//  Created by Marco Abundo on 7/26/24.
//

import Foundation

@MainActor
@Observable class LunchScheduleViewModel {
    var weeklyMenus = [WeeklyMenu]()
    var isFetching = false

    private let lunchMenuDataSource = LunchMenuDataSource()

    func fetchLunchMenu() async {
        guard !isFetching else { return }
        isFetching = true

        weeklyMenus.removeAll()

        let apiResult = await lunchMenuDataSource.getLunchMenu()

        for (index, menuItemNames) in apiResult.enumerated() {
            var menuItems = [MenuItem]()

            for (index, name) in menuItemNames.enumerated() {
                guard let weekDay = Weekday(rawValue: index) else { return }

                let menuItem = MenuItem(weekday: weekDay, name: name)
                menuItems.append(menuItem)
            }

            weeklyMenus.append(WeeklyMenu(id: index, menuItems: menuItems))
        }

        isFetching = false
    }
}
