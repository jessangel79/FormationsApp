//
//  Array.swift
//  FormationsApp
//
//  Created by Angelique Babin on 25/06/2020.
//  Copyright © 2020 Angelique Babin. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {

    func removingDuplicates() -> Array {
        return reduce(into: []) { result, element in
            if !result.contains(element) {
                result.append(element)
            }
        }
    }
}
