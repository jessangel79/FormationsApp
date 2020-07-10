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
    
    static let Swift = LangagesString.swift.rawValue
    static let SwiftUi = LangagesString.swiftUi.rawValue
    static let Kotlin = LangagesString.kotlin.rawValue
    static let HtmlCss = LangagesString.htmlCss.rawValue
    static let Git = LangagesString.git.rawValue
    static let Entrepreneuriat = LangagesString.entrepreneuriat.rawValue
    static let CrossPlateform = LangagesString.crossPlateform.rawValue
    static let Others = LangagesString.others.rawValue
    
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
    
    static let ListLangagesCell = "ListLangagesCell"
    static let ListLangagesTableViewCell = "ListLangagesTableViewCell"
    static let SegueToListFormations = "segueToListFormations"
    static let SegueToDetailsFormation = "segueToDetailsFormation"
    static let SegueToWebsite = "segueToWebsite"
    
//    static let ListSkillsCell = "ListSkillsCell"
//    static let ListSkillsTableViewCell = "ListSkillsTableViewCell"
//    static let SegueToDetailsSkill = "segueToDetailsSkill"
//    static let SegueToWebsiteSkill = "segueToWebsiteSkill"

//    static let ListStudiesCell = "ListStudiesCell"
//    static let ListStudiesTableViewCell = "ListStudiesTableViewCell"
}
