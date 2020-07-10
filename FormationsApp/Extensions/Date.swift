//
//  Date.swift
//  FormationsApp
//
//  Created by Angelique Babin on 07/07/2020.
//  Copyright © 2020 Angelique Babin. All rights reserved.
//

import Foundation

extension Date {
    
    /// format type date in type string
    func toString(format: String = "dd-MM-yyyy") -> String { // "yyyy-MM-dd"
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
