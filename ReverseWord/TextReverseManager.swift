//
//  TextReverseManager.swift
//  ReverseWord
//
//  Created by Andrey Baykov on 10/22/22.
//

import Foundation

final class TextReverseManager {
    
    func reversedString(originText: String, customMode: Bool, ignoredCaracters: String) -> String {
        let arrayOrigin = [String](originText.components(separatedBy: " "))
        var arrayOutput = [String]()
        for word in arrayOrigin {
            arrayOutput.append(String(anagramWordReversed(originWord: word, customtMode: customMode, ignoredCaracters: ignoredCaracters)))
        }
        return arrayOutput.joined(separator: " ")
    }
    
    private func anagramWordReversed(originWord: String, customtMode: Bool, ignoredCaracters: String) -> String{
        var lettersArray = [String]()
        var arrayOutput = [String]()
        var ignoredSymbols = [String]()
        for char in originWord {
            if customtMode && ignoredCaracters.contains(char) {
                ignoredSymbols.append(String(char))
            } else if !customtMode && !char.isLetter {
                ignoredSymbols.append(String(char))
            }
        }
        for char in originWord {
            if !ignoredSymbols.contains(String(char)) {
                lettersArray.append(String(char))
            }
        }
        for char in originWord {
            if ignoredSymbols.contains(String(char)) {
                arrayOutput.append(String(char))
            } else {
                arrayOutput.append(lettersArray.popLast()!)
            }
        }
        return arrayOutput.joined()
    }
}
