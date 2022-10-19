//
//  ReverseWordTests.swift
//  Reverse word tests
//
//  Created by Andrey Baykov on 10/18/22.
//

import XCTest
@testable import ReverseWord

final class Reverse_word_tests: XCTestCase {
    
    let originTextArray = ["Test string", "Hello world", "ios"]
    let correctAnswersArray = ["tseT gnirts", "olleH dlrow", "soi"]
    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }

    func testReversedString() throws {
        for index in 0...originTextArray.count - 1 {
            XCTAssertEqual(ReverseWordsViewController().reversedString(originText: originTextArray[index]), correctAnswersArray[index])
        }
    }

}
