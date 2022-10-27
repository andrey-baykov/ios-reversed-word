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
        XCTAssertEqual(textReverseManager?.reversedString(originText: "abcd efgh", ignoredCaracters: ""), "dcba hgfe")
    }
    
    func testDefaultReversedStringWithNumbers() throws {
        XCTAssertEqual(textReverseManager?.reversedString(originText: "Foxminded cool 24/7", ignoredCaracters: ""), "dednimxoF looc 24/7")
    }
    
    func testDefaultReversedStringWithSpecialCharacters() throws {
        XCTAssertEqual(textReverseManager?.reversedString(originText: "a1bcd efg!h", ignoredCaracters: ""), "d1cba hgf!e")
    }
    
    func testReversedAnagramWordDefaultWithExclamationSymbol() throws {
        XCTAssertEqual(textReverseManager?.anagramWordReversed(originWord: "a!bcd"), "d!cba")
    }
    
    func testReversedAnagramWordDefaultWithNumber() throws {
        XCTAssertEqual(textReverseManager?.anagramWordReversed(originWord: "a1bcd"), "d1cba")
    }
    
    func testReversedAnagramWordDefaultOnlyLetters() throws {
        XCTAssertEqual(textReverseManager?.anagramWordReversed(originWord: "Foxminded", ignoredCaracters: ""), "dednimxoF")
    }
    
    func testReversedAnagramWordDefaultNoLetters() throws {
        XCTAssertEqual(textReverseManager?.anagramWordReversed(originWord: "24/7"), "24/7")
    }
    
    func testReversedAnagramCustomIgnoredLetters() throws {
        XCTAssertEqual(textReverseManager?.reversedString(originText: "a1bcd efglh", ignoredCaracters: "xl"), "dcb1a hgfle")
    }
    
    func testReversedAnagramCustomWithoutIgnoredLetters() throws {
        XCTAssertEqual(textReverseManager?.reversedString(originText: "abcd efgh", ignoredCaracters: "xl"), "dcba hgfe")
    }
    
    func testReversedAnagramCustomWithIgnoredLettersAndNumbers() throws {
        XCTAssertEqual(textReverseManager?.reversedString(originText: "Foxminded cool 24/7", ignoredCaracters: "xl"), "dexdnimoF oocl 7/42")
    }
    
    func testReversedAnagramCustomWithoutIgnoredWord() throws {
        XCTAssertEqual(textReverseManager?.reversedString(originText: "Foxminded cool 24/7", ignoredCaracters: "Foxminded"), "Foxminded looc 7/42")
    }
    
}
