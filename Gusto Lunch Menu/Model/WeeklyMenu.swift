//
//  WeeklyMenu.swift
//  Gusto Lunch Menu
//
//  Created by Marco Abundo on 7/26/24.
//

import Foundation

struct WeeklyMenu: Identifiable {    
    let id: Int
    let menuItems: [MenuItem]
}

struct MenuItem {
    let weekday: Weekday
    let name: String
}

enum Weekday: Int {
    case MONDAY = 0
    case TUESDAY
    case WEDNESDAY
    case THURSDAY
    case FRIDAY

    var asString : String {
        var resource = ""
        switch self {
        case .MONDAY: resource =  "Monday"
        case .TUESDAY : resource =  "Tuesday"
        case .WEDNESDAY:  resource =  "Wednesday"
        case .THURSDAY: resource = "Thursday"
        case .FRIDAY: resource = "Friday"
        }

        // Use Internationalization, as appropriate.
        return NSLocalizedString(resource, comment: resource)
    }
}
