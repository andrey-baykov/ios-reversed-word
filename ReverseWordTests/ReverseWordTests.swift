//
//  ReverseWordTests.swift
//  Reverse word tests
//
//  Created by Andrey Baykov on 10/18/22.
//

import XCTest
@testable import ReverseWord

final class ReverseWordTests: XCTestCase {
    
    var textReverseManager: TextReverseManager?
    
    override func setUpWithError() throws {
        textReverseManager = TextReverseManager()
    }

    override func tearDownWithError() throws {
        textReverseManager = nil
    }

    func testReversedStringLettersOnly() throws {
        XCTAssertEqual(textReverseManager?.reversedString(originText: "Test string"), "tseT gnirts")
    }
    
    func testReversedStringWithNumbers() throws {
        XCTAssertEqual(textReverseManager?.reversedString(originText: "Hel1o w0rld"), "o1leH dlr0w")
    }
    
    func testReversedStringWithSpecialCharacters() throws {
        XCTAssertEqual(textReverseManager?.reversedString(originText: "!os"), "so!")
    }

}
