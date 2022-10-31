//
//  ReverseWordTests.swift
//  Reverse word tests
//
//  Created by Andrey Baykov on 10/18/22.
//

import XCTest
@testable import ReverseWord

final class ReverseWordTests: XCTestCase {
    
    var textReverseManager: TextReverseManager!
    
    override func setUpWithError() throws {
        textReverseManager = TextReverseManager()
    }

    override func tearDownWithError() throws {
        textReverseManager = nil
    }

    func testDefaultReversedStringLettersOnly() throws {
        XCTAssertEqual(textReverseManager?.reversedString(originText: "abcd efgh", customtMode: false, ignoredCaracters: ""), "dcba hgfe")
    }
    
    func testDefaultReversedStringWithNumbers() throws {
        XCTAssertEqual(textReverseManager?.reversedString(originText: "Foxminded cool 24/7", customtMode: false, ignoredCaracters: ""), "dednimxoF looc 24/7")
    }
    
    func testDefaultReversedStringWithSpecialCharacters() throws {
        XCTAssertEqual(textReverseManager?.reversedString(originText: "a1bcd efg!h", customtMode: false, ignoredCaracters: ""), "d1cba hgf!e")
    }
    
    func testReversedAnagramWordDefaultOnlyLetters() throws {
        XCTAssertEqual(textReverseManager?.reversedString(originText: "Foxminded", customtMode: false, ignoredCaracters: ""), "dednimxoF")
    }
    
    func testReversedAnagramCustomIgnoredLetters() throws {
        XCTAssertEqual(textReverseManager?.reversedString(originText: "a1bcd efglh", customtMode: true, ignoredCaracters: "xl"), "dcb1a hgfle")
    }
    
    func testReversedAnagramCustomWithoutIgnoredLetters() throws {
        XCTAssertEqual(textReverseManager?.reversedString(originText: "abcd efgh", customtMode: true, ignoredCaracters: "xl"), "dcba hgfe")
    }
    
    func testReversedAnagramCustomWithIgnoredLettersAndNumbers() throws {
        XCTAssertEqual(textReverseManager?.reversedString(originText: "Foxminded cool 24/7", customtMode: true, ignoredCaracters: "xl"), "dexdnimoF oocl 7/42")
    }
    
    func testReversedAnagramCustomWithoutIgnoredWord() throws {
        XCTAssertEqual(textReverseManager?.reversedString(originText: "Foxminded cool 24/7", customtMode: true, ignoredCaracters: "Foxminded"), "Foxminded looc 7/42")
    }
    
}
