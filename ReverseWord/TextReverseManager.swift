//
//  TextReverseManager.swift
//  ReverseWord
//
//  Created by Andrey Baykov on 10/22/22.
//

import Foundation

final class TextReverseManager {
    
    func reversedString(originText: String, ignoredCaracters: String) -> String {
        let arrayOrigin = [String](originText.components(separatedBy: " "))
        var arrayOutput = [String]()
        for word in arrayOrigin {
            if ignoredCaracters != "" {
                arrayOutput.append(String(anagramWordReversed(originWord: word, ignoredCaracters: ignoredCaracters)))
            } else {
                arrayOutput.append(String(anagramWordReversed(originWord: word)))
            }
            
        }
        return arrayOutput.joined(separator: " ")
    }
    
    func anagramWordReversed(originWord: String) -> String{
        var lettersArray = [String]()
        var arrayOutput = [String]()
    
        for char in originWord {
            if char.isLetter {
                lettersArray.append(String(char))
            }
        }
        for char in originWord {
            if char.isLetter {
                arrayOutput.append(lettersArray.popLast()!)
            } else {
                arrayOutput.append(String(char))
            }
        }
   
       
        
        return arrayOutput.joined()
    }
    
    func anagramWordReversed(originWord: String, ignoredCaracters: String) -> String{
        var lettersArray = [String]()
        var arrayOutput = [String]()
        
        for char in originWord {
            if (!ignoredCaracters.contains(char)) {
                lettersArray.append(String(char))
            }
        }
        for char in originWord {
            if (!ignoredCaracters.contains(char)) {
                arrayOutput.append(lettersArray.popLast()!)
            } else {
                arrayOutput.append(String(char))
            }
        }

        return arrayOutput.joined()
    }
}
