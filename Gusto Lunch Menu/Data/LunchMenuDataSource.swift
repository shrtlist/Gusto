//
//  LunchMenuDataSource.swift
//  Gusto Lunch Menu
//
//  Created by GustoBot on 6/14/22.
//

import Foundation

class LunchMenuDataSource {

    @available(*, renamed: "getLunchMenu()")
    func getLunchMenu(_ completion: @escaping (Array<Array<String>>) -> Void) {
        Task {
            let result = await getLunchMenu()
            completion(result)
        }
    }

    func getLunchMenu() async -> Array<Array<String>> {
        return await withCheckedContinuation { continuation in
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                continuation.resume(returning: [
                    ["Chicken and waffles", "Tacos", "Curry", "Pizza", "Sushi"],
                    ["Breakfast for lunch", "Hamburgers", "Spaghetti", "Salmon", "Sandwiches"]
                ])
            }
        }
    }
}
