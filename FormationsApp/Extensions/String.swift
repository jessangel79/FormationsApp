//
//  String.swift
//  FormationsApp
//
//  Created by Angelique Babin on 07/07/2020.
//  Copyright © 2020 Angelique Babin. All rights reserved.
//

import Foundation

extension String {
    
    /// encode string for url
    var stringUrlAllowed: String {
        let string = self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
        return string
    }
    
    /// delete whitespaces
    var deleteWhitespaces: String {
        let whitespacesDeleted = self.replacingOccurrences(of: " ", with: "")
        return whitespacesDeleted
    }
}
