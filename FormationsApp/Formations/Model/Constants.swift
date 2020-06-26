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
    
    static let Swift = Langages.swift.rawValue
    static let SwiftUi = Langages.swiftUi.rawValue
    static let Kotlin = Langages.kotlin.rawValue
    static let HtmlCss = Langages.htmlCss.rawValue
    static let Git = Langages.git.rawValue
    static let Entrepreneuriat = Langages.entrepreneuriat.rawValue
    static let CrossPlateform = Langages.crossPlateform.rawValue
    static let Others = Langages.others.rawValue
    
    static let ListLangagesCell = "ListLangagesCell"
    static let ListLangagesTableViewCell = "ListLangagesTableViewCell"
    static let SegueToListOrganizations = "segueToListOrganizations"
    //    static let SegueToLangagesList = "segueToLangagesList"
}
