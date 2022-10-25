//
//  TextReverseManager.swift
//  ReverseWord
//
//  Created by Andrey Baykov on 10/22/22.
//

import Foundation

final class TextReverseManager {
    
    func reversedString(originText: String) -> String {
        let arrayOrigin = [String](originText.components(separatedBy: " "))
        var arrayOutput = [String]()
        for word in arrayOrigin {
            arrayOutput.append(String(word.reversed()))
        }
        return arrayOutput.joined(separator: " ")
    }
    
}
