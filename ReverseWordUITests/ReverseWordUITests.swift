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
    
    private func runCommonTestSteps(){
        inputTextField.tap()
        inputTextField.typeText("Test string")
        returnButton.tap()
        reverseButton.tap()
    }
    
    func testReverseWordOnce() throws {
        runCommonTestSteps()
        XCTAssertEqual(reversedLabel.label, "tseT gnirts")
        XCTAssertEqual(reverseButton.label, "Clear")
    }

    func testReverseWordWithClear() throws {
        runCommonTestSteps()
        XCTAssertEqual(reversedLabel.label, "tseT gnirts")
        XCTAssertEqual(reverseButton.label, "Clear")
        reverseButton.tap()
        XCTAssertFalse(reversedLabel.exists)
        XCTAssertEqual(reverseButton.label, "Reverse")
    }
    
    func testReverseWordWithAddedText() throws {
        runCommonTestSteps()
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
