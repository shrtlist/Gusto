//
//  Gusto_Lunch_MenuTests.swift
//  Gusto Lunch MenuTests
//
//  Created by GustoBot on 6/14/22.
//

import XCTest
@testable import Gusto_Lunch_Menu

class Gusto_Lunch_MenuTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    @MainActor func testFetchLunchMenu() async {
        let sut = LunchScheduleViewModel()

        XCTAssertTrue(sut.isFetching)

        await sut.fetchLunchMenu()

        XCTAssertFalse(sut.isFetching)
        XCTAssertTrue(sut.weeklyMenus.count > 0)
    }

    func testMenuItem() {
        let menuItem = MenuItem(weekday: Weekday.TUESDAY, name: "Tacos")

        XCTAssertEqual(menuItem.weekday, .TUESDAY, "weekday must be TUESDAY")
        XCTAssertEqual(menuItem.name, "Tacos", "Name must be tacos")
    }

    func testWeeklyMenu() {
        let menuItem = MenuItem(weekday: Weekday.TUESDAY, name: "Tacos")
        let weeklyMenu = WeeklyMenu(id: 0, menuItems: [menuItem])

        XCTAssertEqual(weeklyMenu.id, 0, "id must be 0")
        XCTAssertEqual(weeklyMenu.menuItems.count, 1, "Number of menuItems must be 1")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
