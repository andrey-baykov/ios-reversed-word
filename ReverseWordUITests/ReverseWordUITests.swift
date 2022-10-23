//
//  ReverseWordUITests.swift
//  ReverseWordUITests
//
//  Created by Andrey Baykov on 10/19/22.
//

import XCTest

final class ReverseWordUITests: XCTestCase {
    
    let app = XCUIApplication()
    private lazy var inputTextField = app.textFields["inputTextField"]
    private lazy var returnButton = app.buttons["return"]
    private lazy var reverseButton = app.buttons["reverseButton"]
    private lazy var reversedLabel = app.staticTexts["reversedLabel"]
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
    
    func testReverseWordOnce() throws {
        inputTextField.tap()
        inputTextField.typeText("Test string")
        returnButton.tap()
        reverseButton.tap()
        XCTAssertEqual(reversedLabel.label, "tseT gnirts")
        XCTAssertEqual(reverseButton.label, "Clear")
    }

    func testReverseWordWithClear() throws {
        inputTextField.tap()
        inputTextField.typeText("Test string")
        returnButton.tap()
        reverseButton.tap()
        XCTAssertEqual(reversedLabel.label, "tseT gnirts")
        XCTAssertEqual(reverseButton.label, "Clear")
        reverseButton.tap()
        XCTAssertEqual(inputTextField.label, "")
        XCTAssertEqual(reverseButton.label, "Reverse")
    }
    
    func testReverseWordWithAddedText() throws {
        inputTextField.tap()
        inputTextField.typeText("Test string")
        returnButton.tap()
        reverseButton.tap()
        XCTAssertEqual(reversedLabel.label, "tseT gnirts")
        XCTAssertEqual(reverseButton.label, "Clear")
        inputTextField.tap()
        app.keys["space"].tap()
        XCTAssertEqual(reverseButton.label, "Reverse")
        app.keys["a"].tap()
        app.keys["d"].tap()
        app.keys["d"].tap()
        app.keys["e"].tap()
        app.keys["d"].tap()
        returnButton.tap()
        reverseButton.tap()
        XCTAssertEqual(reversedLabel.label, "tseT gnirts dedda")
        XCTAssertEqual(reverseButton.label, "Clear")
    }
}
