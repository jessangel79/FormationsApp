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

    static let Formations = "FORMATIONS"
    static let Websites = "LIEN DU SITE"
    static let States = "STATUT"
    static let Langages = "LANGAGES"
    static let Org = "ORGANISMES"
    static let Notes = "NOTES"
    static let Details = "DETAILS"
    
    static let Swift = LangagesString.swift.rawValue
    static let SwiftUi = LangagesString.swiftUi.rawValue
    static let Kotlin = LangagesString.kotlin.rawValue
    static let HtmlCss = LangagesString.htmlCss.rawValue
    static let Git = LangagesString.git.rawValue
    static let Entrepreneuriat = LangagesString.entrepreneuriat.rawValue
    static let CrossPlateform = LangagesString.crossPlateform.rawValue
    static let Others = LangagesString.others.rawValue
    
    static let Udemy = Organizations.udemy.rawValue
    static let Hws = Organizations.hws.rawValue
    static let Coursera = Organizations.coursera.rawValue
    static let SwiftOrg = Organizations.swiftOrg.rawValue
    static let PurpleGiraffe = Organizations.purpleGiraffe.rawValue
    static let Cwc = Organizations.cwc.rawValue
    static let CodinGame = Organizations.codinGame.rawValue
    static let Microsoft = Organizations.microsoft.rawValue
    static let Raywenderlich = Organizations.raywenderlich.rawValue
    static let LearnGitBranching = Organizations.learnGitBranching.rawValue
    static let OpenClassrooms = Organizations.openClassrooms.rawValue
    static let Divers = Organizations.divers.rawValue
    
    static let ListLangagesCell = "ListLangagesCell"
    static let ListLangagesTableViewCell = "ListLangagesTableViewCell"
//    static let SegueToListOrganizations = "segueToListOrganizations"
    static let SegueToListFormations = "segueToListFormations"
    static let SegueToDetailsFormation = "segueToDetailsFormation"
    //    static let SegueToLangagesList = "segueToLangagesList"
    static let SegueToWebsite = "segueToWebsite"
}
