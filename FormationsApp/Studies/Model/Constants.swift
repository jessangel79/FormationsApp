//
//  Constants.swift
//  FormationsApp
//
//  Created by Angelique Babin on 23/06/2020.
//  Copyright © 2020 Angelique Babin. All rights reserved.
//

import Foundation
import CoreXLSX

// MARK: - Trick to get static variable in Swift

struct Constants {
    static let columnA = ColumnReference("A")
    static let columnB = ColumnReference("B")
    static let columnC = ColumnReference("C")
    static let columnD = ColumnReference("D")
    static let columnE = ColumnReference("E")
    static let columnF = ColumnReference("F")
    static let columnG = ColumnReference("G")
    static let columnH = ColumnReference("H")
    static let columnI = ColumnReference("I")
    
    static let ListStudiesCell = "ListStudiesCell"
    static let ListStudiesTableViewCell = "ListStudiesTableViewCell"
    static let SegueToDetailsStudy = "segueToDetailsStudy"
    static let SegueToWebsiteStudy = "segueToWebsiteStudy"
}
