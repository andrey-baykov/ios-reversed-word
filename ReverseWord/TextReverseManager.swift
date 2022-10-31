//
//  TextReverseManager.swift
//  ReverseWord
//
//  Created by Andrey Baykov on 10/22/22.
//

import Foundation

final class TextReverseManager {
    
    func reversedString(originText: String, customtMode: Bool, ignoredCaracters: String) -> String {
        let arrayOrigin = [String](originText.components(separatedBy: " "))
        var arrayOutput = [String]()
        for word in arrayOrigin {
            arrayOutput.append(String(anagramWordReversed(originWord: word, customtMode: customtMode, ignoredCaracters: ignoredCaracters)))
        }
        return arrayOutput.joined(separator: " ")
    }
    
    private func anagramWordReversed(originWord: String, customtMode: Bool, ignoredCaracters: String) -> String{
        var lettersArray = [String]()
        var arrayOutput = [String]()
        var arrayOfIgnoredSymbols = [String]()
        for char in originWord {
            if customtMode && ignoredCaracters.contains(char) {
                arrayOfIgnoredSymbols.append(String(char))
            } else if !customtMode && !char.isLetter {
                arrayOfIgnoredSymbols.append(String(char))
            }
        }
        for char in originWord {
            if !arrayOfIgnoredSymbols.contains(String(char)) {
                lettersArray.append(String(char))
            }
        }
        for char in originWord {
            if arrayOfIgnoredSymbols.contains(String(char)) {
                arrayOutput.append(String(char))
            } else {
                arrayOutput.append(lettersArray.popLast()!)
            }
        }
        return arrayOutput.joined()
    }
}
