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
    private lazy var switchModeSegmentedControl = app.segmentedControls["switchMode"]
    private lazy var ignoredTextField = app.textFields["ignoredTextField"]
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
    
    private func runCommonTestSteps(){
        inputTextField.tap()
        inputTextField.typeText("Test string")
        returnButton.tap()
        switchModeSegmentedControl.swipeLeft()
        reverseButton.tap()
    }
    
    private func runCommonTestStepsDefaultMode(testString: String) {
        inputTextField.tap()
        inputTextField.typeText(testString)
        returnButton.tap()
        switchModeSegmentedControl.swipeLeft()
        reverseButton.tap()
    }
    
    private func runCommonTestStepsCustomMode(testString: String) {
        inputTextField.tap()
        inputTextField.typeText(testString)
        returnButton.tap()
        switchModeSegmentedControl.swipeRight()
        ignoredTextField.tap()
        ignoredTextField.typeText("xl")
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
    
    func testReverseAnagramDefaultMethodWithNumbers() throws {
        runCommonTestStepsDefaultMode(testString: "Foxminded cool 24/7")
        XCTAssertEqual(reversedLabel.label, "dednimxoF looc 24/7")
        XCTAssertEqual(reverseButton.label, "Clear")
    }
    
    func testReverseAnagramDefaultMethodWithLettersOnly() throws {
        runCommonTestStepsDefaultMode(testString: "abcd efgh")
        XCTAssertEqual(reversedLabel.label, "dcba hgfe")
        XCTAssertEqual(reverseButton.label, "Clear")
    }
    
    func testReverseAnagramDefaultMethodWithNotLettersSymbols() throws {
        runCommonTestStepsDefaultMode(testString: "a1bcd efg!h")
        XCTAssertEqual(reversedLabel.label, "d1cba hgf!e")
        XCTAssertEqual(reverseButton.label, "Clear")
    }
    
    func testReverseAnagramCustomMethodWithNumbers() throws {
        runCommonTestStepsCustomMode(testString: "Foxminded cool 24/7")
        XCTAssertEqual(reversedLabel.label, "dexdnimoF oocl 7/42")
        XCTAssertEqual(reverseButton.label, "Clear")
    }
    
    func testReverseAnagramCustomMethodWithLettersOnly() throws {
        runCommonTestStepsCustomMode(testString: "abcd efgh")
        XCTAssertEqual(reversedLabel.label, "dcba hgfe")
        XCTAssertEqual(reverseButton.label, "Clear")
    }
    
    func testReverseAnagramCustomMethodWithWithNotLettersSymbols() throws {
        runCommonTestStepsCustomMode(testString: "a1bcd !fglh")
        XCTAssertEqual(reversedLabel.label, "dcb1a hgfl!")
        XCTAssertEqual(reverseButton.label, "Clear")
    }
}
