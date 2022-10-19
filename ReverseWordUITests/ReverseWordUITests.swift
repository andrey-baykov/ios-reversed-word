//
//  ReverseWordUITests.swift
//  ReverseWordUITests
//
//  Created by Andrey Baykov on 10/19/22.
//

import XCTest

final class ReverseWordUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {

    }

    func testReverseWordOnce() throws {
        let app = XCUIApplication()
        app.launch()
        app.textFields["inputTextField"].tap()
        app.textFields["inputTextField"].typeText("Test string")
        app.buttons["return"].tap()
        app.buttons["reverseButton"].tap()
        let actualResult: String = app.staticTexts["reversedLabel"].label
        XCTAssertEqual(actualResult, "tseT gnirts")
        XCTAssertEqual(app.buttons["reverseButton"].label, "Clear")
    }

    func testReverseWordWithClear() throws {
        let app = XCUIApplication()
        app.launch()
        app.textFields["inputTextField"].tap()
        app.textFields["inputTextField"].typeText("Test string")
        app.buttons["return"].tap()
        app.buttons["reverseButton"].tap()
        let actualResult: String = app.staticTexts["reversedLabel"].label
        XCTAssertEqual(actualResult, "tseT gnirts")
        XCTAssertEqual(app.buttons["reverseButton"].label, "Clear")
        app.buttons["reverseButton"].tap()
        XCTAssertEqual(app.textFields["inputTextField"].label, "")
        XCTAssertEqual(app.buttons["reverseButton"].label, "Reverse")
    }
    
    func testReverseWordWithAddText() throws {
        let app = XCUIApplication()
        app.launch()
        app.textFields["inputTextField"].tap()
        app.textFields["inputTextField"].typeText("Test string")
        app.buttons["return"].tap()
        app.buttons["reverseButton"].tap()
        let actualResult: String = app.staticTexts["reversedLabel"].label
        XCTAssertEqual(actualResult, "tseT gnirts")
        XCTAssertEqual(app.buttons["reverseButton"].label, "Clear")
        app.textFields["inputTextField"].tap()
        app.keys["space"].tap()
        XCTAssertEqual(app.buttons["reverseButton"].label, "Reverse")
        app.keys["a"].tap()
        app.keys["d"].tap()
        app.keys["d"].tap()
        app.keys["e"].tap()
        app.keys["d"].tap()
        app.buttons["return"].tap()
        app.buttons["reverseButton"].tap()
        let actualResultNew: String = app.staticTexts["reversedLabel"].label
        XCTAssertEqual(actualResultNew, "tseT gnirts dedda")
        XCTAssertEqual(app.buttons["reverseButton"].label, "Clear")
    }
    
}
