//
//  Gusto_Lunch_MenuUITests.swift
//  Gusto Lunch MenuUITests
//
//  Created by GustoBot on 6/14/22.
//

import XCTest

class Gusto_Lunch_MenuUITests: XCTestCase {

    private var app: XCUIApplication!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
    }

    func testNavigationTitleDisplay() { // Checks if the title is being presented

        // Use the XCUIElementQuery to locate the title Text
        let navigationTitleText = app.staticTexts["Rotating Lunch Schedule"]

        // Check if the navigation title text is visible
        XCTAssertTrue(navigationTitleText.exists)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
