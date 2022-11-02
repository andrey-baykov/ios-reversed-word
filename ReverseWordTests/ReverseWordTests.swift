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
        XCTAssertEqual(textReverseManager?.reversedString(originText: "abcd efgh", customMode: false, ignoredCaracters: ""), "dcba hgfe")
    }
    
    func testDefaultReversedStringWithNumbers() throws {
        XCTAssertEqual(textReverseManager?.reversedString(originText: "Foxminded cool 24/7", customMode: false, ignoredCaracters: ""), "dednimxoF looc 24/7")
    }
    
    func testDefaultReversedStringWithSpecialCharacters() throws {
        XCTAssertEqual(textReverseManager?.reversedString(originText: "a1bcd efg!h", customMode: false, ignoredCaracters: ""), "d1cba hgf!e")
    }
    
    func testReversedAnagramWordDefaultOnlyLetters() throws {
        XCTAssertEqual(textReverseManager?.reversedString(originText: "Foxminded", customMode: false, ignoredCaracters: ""), "dednimxoF")
    }
    
    func testReversedAnagramCustomIgnoredLetters() throws {
        XCTAssertEqual(textReverseManager?.reversedString(originText: "a1bcd efglh", customMode: true, ignoredCaracters: "xl"), "dcb1a hgfle")
    }
    
    func testReversedAnagramCustomWithoutIgnoredLetters() throws {
        XCTAssertEqual(textReverseManager?.reversedString(originText: "abcd efgh", customMode: true, ignoredCaracters: "xl"), "dcba hgfe")
    }
    
    func testReversedAnagramCustomWithIgnoredLettersAndNumbers() throws {
        XCTAssertEqual(textReverseManager?.reversedString(originText: "Foxminded cool 24/7", customMode: true, ignoredCaracters: "xl"), "dexdnimoF oocl 7/42")
    }
    
    func testReversedAnagramCustomWithoutIgnoredWord() throws {
        XCTAssertEqual(textReverseManager?.reversedString(originText: "Foxminded cool 24/7", customMode: true, ignoredCaracters: "Foxminded"), "Foxminded looc 7/42")
    }
    
}
