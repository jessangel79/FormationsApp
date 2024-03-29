//
//  String.swift
//  FormationsApp
//
//  Created by Angelique Babin on 07/07/2020.
//  Copyright © 2020 Angelique Babin. All rights reserved.
//

import Foundation

extension String {
    
    /// delete whitespaces
    var deleteWhitespaces: String {
        let whitespacesDeleted = self.replacingOccurrences(of: " ", with: "")
        return whitespacesDeleted
    }
    
    /// remplace whitespaces by "-"
    var removeWhitespaces: String {
        let whitespacesDeleted = self.replacingOccurrences(of: " ", with: "-")
        return whitespacesDeleted
    }
    
    /// delete the 4 last characters
    var dropString: String {
        let stringDropped = self.dropLast(4)
        return String(stringDropped)
    }
    
    /// remplace a string by "e"
    func removeAccent(stringOf: String) -> String {
        let word = self.replacingOccurrences(of: stringOf, with: "e")
        return word
    }
    
    /// delete last characters with string index
    func cutEndString(stringElementOf: String.Element) -> String {
        guard let endOfSentence = self.firstIndex(of: stringElementOf) else { return "" }
        var firstSentence = self[...endOfSentence]
        firstSentence.removeLast()
        return String(firstSentence)
    }
}
