//
//  ReverseWordTests.swift
//  Reverse word tests
//
//  Created by Andrey Baykov on 10/18/22.
//

import XCTest
@testable import ReverseWord

final class ReverseWordTests: XCTestCase {
    
    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }

    func testReversedStringFirst() throws {
        XCTAssertEqual(ReverseWordsViewController().reversedString(originText: "Test string"), "tseT gnirts")
    }
    
    func testReversedStringSecond() throws {
        XCTAssertEqual(ReverseWordsViewController().reversedString(originText: "Hello world"), "olleH dlrow")
    }
    
    func testReversedStringThird() throws {
        XCTAssertEqual(ReverseWordsViewController().reversedString(originText: "ios"), "soi")
    }

}
