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

// MARK: - création du tableau de tableaux
//extension Array where Element == Organizations {
//    var convertedToArrayOfArray: [[Organizations]] {
//        var dict = [Langages: [Organizations]]()
//
//        for organizations in self where organizations.langage != nil {
//            dict[organizations.langage!, default: []].append(organizations)
//        }
//
//        var result = [[Organizations]]()
//        for (_, val) in dict {
//            result.append(val)
//        }
//
//        return result
//    }
//}
