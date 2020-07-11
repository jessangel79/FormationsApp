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
    static let columnHDates = ColumnReference("H")
    static let columnIDates = ColumnReference("I")
    static let ToDo = "A faire"
    
    static let Swift = ThemesString.swift.rawValue
    static let SwiftUi = ThemesString.swiftUi.rawValue
    static let Kotlin = ThemesString.kotlin.rawValue
    static let HtmlCss = ThemesString.htmlCss.rawValue
    static let Git = ThemesString.git.rawValue
    static let Entrepreneuriat = ThemesString.entrepreneuriat.rawValue
    static let CrossPlateform = ThemesString.crossPlateform.rawValue
    static let Others = ThemesString.others.rawValue
    
    static let Udemy = Organizations.udemy.rawValue.lowercased()
    static let Hws = Organizations.hws.rawValue.lowercased()
    static let Coursera = Organizations.coursera.rawValue.lowercased()
    static let SwiftOrg = Organizations.swiftOrg.rawValue.lowercased()
    static let PurpleGiraffe = Organizations.purpleGiraffe.rawValue.lowercased()
    static let Cwc = Organizations.cwc.rawValue.lowercased()
    static let CodinGame = Organizations.codinGame.rawValue.lowercased()
    static let Microsoft = Organizations.microsoft.rawValue.lowercased()
    static let Raywenderlich = Organizations.raywenderlich.rawValue.lowercased()
    static let LearnGitBranching = Organizations.learnGitBranching.rawValue.lowercased()
    static let OpenClassrooms = Organizations.openClassrooms.rawValue.lowercased()
    static let Divers = Organizations.divers.rawValue.lowercased()
    
    static let ListFormationsCell = "ListFormationsCell" // "ListLangagesCell"
    static let ListFormationsTableViewCell = "ListFormationsTableViewCell" // "ListLangagesTableViewCell"
    static let SegueToListFormations = "segueToListFormations"
    static let SegueToDetailsFormation = "segueToDetailsFormation"
    static let SegueToWebsite = "segueToWebsite"
}
