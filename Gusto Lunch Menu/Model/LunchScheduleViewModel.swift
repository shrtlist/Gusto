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
    @Published var isFetching = true

    private let lunchMenuDataSource = LunchMenuDataSource()

    func fetchLunchMenu() async {
        weeklyMenus.removeAll()

        isFetching = true

        let apiResult = await lunchMenuDataSource.getLunchMenu()

        for (index, menuItemNames) in apiResult.enumerated() {
            let weekIndex = index + 1

            var menuItems = [MenuItem]()

            for (index, name) in menuItemNames.enumerated() {
                guard let weekDay = Weekday(rawValue: index) else { return }

                let menuItem = MenuItem(weekday: weekDay, name: name)
                menuItems.append(menuItem)
            }

            weeklyMenus.append(WeeklyMenu(id: weekIndex, menuItems: menuItems))
        }

        isFetching = false
    }
}
