//
//  FileService.swift
//  FormationsApp
//
//  Created by Angelique Babin on 26/06/2020.
//  Copyright © 2020 Angelique Babin. All rights reserved.
//

import Foundation
import CoreXLSX

final class FileService {
    
    // MARK: - Vars

    private var columns = Columns()
    var allList = [Langages]()
    var allDict = [String: [Langages]]()
    var langagesList = [String]()
    var langagesDict = [String: [String]]() // dictionnary [Langages : [Organizations]]
    var organizationsList = [String]() // 12 organizations
    var organizationsDict = [String: [String]]() // dictionnary [Langages : [Organizations]]

    var formationsList = [String]()
    var websitesList = [String]()
    var statesList = [String]()
    var langageNamesList = [String]() // 8 langages
    var notesList = [String]()
    var detailsList = [String]()
    
    var formationsDict = [String: [String]]()
    var websitesDict = [String: [String]]()
    var statesDict = [String: [String]]()
    var notesDict = [String: [String]]()
    var detailsDict = [String: [String]]()
    
    var swiftList = [String]()
    var swiftUiList = [String]()
    var kotlinList = [String]()
    var htmlCssList = [String]()
    var crossPlateformList = [String]()
    var gitList = [String]()
    var entrepreneuriatList = [String]()
    var othersList = [String]()
    
//    var udemyList = [String]()
//    var hwsList = [String]()
//    var courseraList = [String]()
//    var swiftOrgList = [String]()
//    var purpleGiraffeList = [String]()
//    var cwcList = [String]()
//    var codinGameList = [String]()
//    var microsoftList = [String]()
//    var raywenderlichList = [String]()
//    var learnGitBranchingList = [String]()
//    var openClassroomsList = [String]()
//    var diversList = [String]()
    
    // MARK: - Methods
    
    func parseFile(_ file: XLSXFile) throws {
        for wbk in try file.parseWorkbooks() {
            for (name, path) in try file.parseWorksheetPathsAndNames(workbook: wbk) {
                if let worksheetName = name {
                    print("This worksheet has a name: \(worksheetName)")
                }
                let worksheet = try file.parseWorksheet(at: path)
                setColumnsFile(file: file, worksheet: worksheet)
                
                let sharedStrings = try file.parseSharedStrings()
                
                let keyFormation = worksheet.data?.rows[0].cells[0].stringValue(sharedStrings) ?? ""
                formationsDict = [keyFormation: []]
                let keyWebsite = worksheet.data?.rows[0].cells[1].stringValue(sharedStrings) ?? ""
                websitesDict = [keyWebsite: []]
                let keyState = worksheet.data?.rows[0].cells[2].stringValue(sharedStrings) ?? ""
                statesDict = [keyState: []]
                let keyLangage = worksheet.data?.rows[0].cells[3].stringValue(sharedStrings) ?? ""
                langagesDict = [keyLangage: []]
                let keyOrganization = worksheet.data?.rows[0].cells[4].stringValue(sharedStrings) ?? ""
                organizationsDict = [keyOrganization: []]
                let keyNote = worksheet.data?.rows[0].cells[5].stringValue(sharedStrings) ?? ""
                notesDict = [keyNote: []]
                let keyDetail = worksheet.data?.rows[0].cells[6].stringValue(sharedStrings) ?? ""
                detailsDict = [keyDetail: []]
            
                createLists(worksheet, sharedStrings)
                setDictionnaries(KeyParameters(keyFormation: keyFormation, keyWebsite: keyWebsite,
                                               keyState: keyState, keyLangage: keyLangage,
                                               keyOrganization: keyOrganization, keyNote: keyNote,
                                               keyDetail: keyDetail))
                createAllList()
                createArrayLangagesCount()
                createOrganizationsDict()
                allDict = ["allItems": allList]
                
                // debug
//                try debugWorksheetRowsAndColumns(file, worksheet)
                debugLangagesList()
//                debugLists()
//                debugDicts()
            }
        }
    }
        
    private func setColumnsFile(file: XLSXFile, worksheet: Worksheet) {
        do {
            let sharedStrings = try file.parseSharedStrings()
            guard let columnA = Constants.columnA else { return }
            guard let columnB = Constants.columnB else { return }
            guard let columnC = Constants.columnC else { return }
            guard let columnD = Constants.columnD else { return }
            guard let columnE = Constants.columnE else { return }
            guard let columnF = Constants.columnF else { return }
            guard let columnG = Constants.columnG else { return }

            columns.columnAStrings = worksheet.cells(atColumns: [columnA])
                .compactMap { $0.stringValue(sharedStrings) }
            columns.columnBStrings = worksheet.cells(atColumns: [columnB])
                .compactMap { $0.stringValue(sharedStrings) }
            columns.columnCStrings = worksheet.cells(atColumns: [columnC])
                .compactMap { $0.stringValue(sharedStrings) }
            columns.columnDStrings = worksheet.cells(atColumns: [columnD])
                .compactMap { $0.stringValue(sharedStrings) }
            columns.columnEStrings = worksheet.cells(atColumns: [columnE])
                .compactMap { $0.stringValue(sharedStrings) }
            columns.columnFStrings = worksheet.cells(atColumns: [columnF])
                .compactMap { $0.stringValue(sharedStrings) }
            columns.columnGStrings = worksheet.cells(atColumns: [columnG])
                .compactMap { $0.stringValue(sharedStrings) }
        } catch {
            print("error : \(error.localizedDescription)")
        }
    }
    
    fileprivate func createLists(_ worksheet: Worksheet, _ sharedStrings: SharedStrings) {
        for row in worksheet.data?.rows ?? [] {
            formationsList.append(row.cells[0].stringValue(sharedStrings) ?? "")
            websitesList.append(row.cells[1].stringValue(sharedStrings) ?? "")
            statesList.append(row.cells[2].stringValue(sharedStrings) ?? "")
            langagesList.append(row.cells[3].stringValue(sharedStrings) ?? "")
            organizationsList.append(row.cells[4].stringValue(sharedStrings) ?? "")
            notesList.append(row.cells[5].stringValue(sharedStrings) ?? "")
            detailsList.append(row.cells[6].stringValue(sharedStrings) ?? "")
        }
    }
    
    fileprivate func createAllList() {
        allList = [Langages(formations: formationsList,
                            webSites: websitesList,
                            states: statesList,
                            langageNames: langagesList,
                            organizations: organizationsList,
                            notes: notesList,
                            details: detailsList)]
    }
    
    fileprivate func createLangagesList(countParameters: CountParameters) {
        createSwiftList(countParameters.countSwift)
        createSwiftUiList(countParameters.countSwift, countParameters.countSwiftUi)
        createKotlinList(countParameters.countSwift, countParameters.countSwiftUi, countParameters.countKotlin)
        createHtmlCssList(countParameters.countSwift, countParameters.countSwiftUi, countParameters.countKotlin, countParameters.countHtmlCss)
        createGitList(countParameters.countSwift, countParameters.countSwiftUi, countParameters.countKotlin, countParameters.countHtmlCss, countParameters.countGit)
        createEntrepreneuriatList(countParameters.countSwift, countParameters.countSwiftUi,
                                  countParameters.countKotlin, countParameters.countHtmlCss,
                                  countParameters.countGit, countParameters.countEntrepreneuriat)
        createCrossPlateformList(countParameters.countSwift, countParameters.countSwiftUi,
                                 countParameters.countKotlin, countParameters.countHtmlCss,
                                 countParameters.countGit, countParameters.countEntrepreneuriat,
                                 countParameters.countCrossPlateform)
        createOthersList(countParameters: countParameters)
//        createOthersList(countParameters.countSwift, countParameters.countSwiftUi,
//                         countParameters.countKotlin, countParameters.countHtmlCss,
//                         countParameters.countGit, countParameters.countEntrepreneuriat,
//                         countParameters.countCrossPlateform, countParameters.countOthers)
    }
    
//    fileprivate func createLangagesList(_ countSwift: [String], _ countSwiftUi: [String], _ countKotlin: [String], _ countHtmlCss: [String], _ countGit: [String], _ countEntrepreneuriat: [String], _ countCrossPlateform: [String], _ countOthers: [String]) {
//        createSwiftList(countSwift)
//        createSwiftUiList(countSwift, countSwiftUi)
//        createKotlinList(countSwift, countSwiftUi, countKotlin)
//        createHtmlCssList(countSwift, countSwiftUi, countKotlin, countHtmlCss)
//        createGitList(countSwift, countSwiftUi, countKotlin, countHtmlCss, countGit)
//        createEntrepreneuriatList(countSwift, countSwiftUi, countKotlin, countHtmlCss, countGit, countEntrepreneuriat)
//        createCrossPlateformList(countSwift, countSwiftUi, countKotlin, countHtmlCss, countGit, countEntrepreneuriat, countCrossPlateform)
//        createOthersList(countSwift, countSwiftUi, countKotlin, countHtmlCss, countGit, countEntrepreneuriat, countCrossPlateform, countOthers)
//    }
    
//    fileprivate func createArrayLangagesCount(_ countParamaters: inout CountParameters) {
//         for langage in langagesList {
//             switch langage {
//             case Constants.Swift:
//                countParamaters.countSwift.append(langage)
//             case Constants.SwiftUi:
//                countParamaters.countSwiftUi.append(langage)
//             case Constants.Kotlin:
//                countParamaters.countKotlin.append(langage)
//             case Constants.HtmlCss:
//                countParamaters.countHtmlCss.append(langage)
//             case Constants.Git:
//                countParamaters.countGit.append(langage)
//             case Constants.Entrepreneuriat:
//                countParamaters.countEntrepreneuriat.append(langage)
//             case Constants.CrossPlateform:
//                countParamaters.countCrossPlateform.append(langage)
//             default:
//                countParamaters.countOthers.append(langage)
//             }
//         }
//     }
    
    fileprivate func createArrayLangagesCount() {
        var countSwift = [String]()
        var countSwiftUi = [String]()
        var countKotlin = [String]()
        var countHtmlCss = [String]()
        var countGit = [String]()
        var countEntrepreneuriat = [String]()
        var countCrossPlateform = [String]()
        var countOthers = [String]()
        for langage in langagesList {
            switch langage {
            case Constants.Swift:
                countSwift.append(langage)
            case Constants.SwiftUi:
                countSwiftUi.append(langage)
            case Constants.Kotlin:
                countKotlin.append(langage)
            case Constants.HtmlCss:
                countHtmlCss.append(langage)
            case Constants.Git:
                countGit.append(langage)
            case Constants.Entrepreneuriat:
                countEntrepreneuriat.append(langage)
            case Constants.CrossPlateform:
                countCrossPlateform.append(langage)
            default:
                countOthers.append(langage)
            }
        }
        createLangagesList(countParameters: CountParameters(countSwift: countSwift, countSwiftUi: countSwiftUi,
                                                            countKotlin: countKotlin, countHtmlCss: countHtmlCss,
                                                            countGit: countGit, countEntrepreneuriat: countEntrepreneuriat,
                                                            countCrossPlateform: countCrossPlateform,
                                                            countOthers: countOthers))
        
        debugListCount(countSwift, countSwiftUi, countKotlin, countHtmlCss, countGit, countEntrepreneuriat, countCrossPlateform, countOthers)
    }
    
    // ok
//    fileprivate func createArrayLangagesCount(_ countSwift: inout [String], _ countSwiftUi: inout [String], _ countKotlin: inout [String], _ countHtmlCss: inout [String], _ countGit: inout [String], _ countEntrepreneuriat: inout [String], _ countCrossPlateform: inout [String], _ countOthers: inout [String]) {
//        for langage in langagesList {
//            switch langage {
//            case Constants.Swift:
//                countSwift.append(langage)
//            case Constants.SwiftUi:
//                countSwiftUi.append(langage)
//            case Constants.Kotlin:
//                countKotlin.append(langage)
//            case Constants.HtmlCss:
//                countHtmlCss.append(langage)
//            case Constants.Git:
//                countGit.append(langage)
//            case Constants.Entrepreneuriat:
//                countEntrepreneuriat.append(langage)
//            case Constants.CrossPlateform:
//                countCrossPlateform.append(langage)
//            default:
//                countOthers.append(langage)
//            }
//        }
//    }
    
    fileprivate func createSwiftList(_ countSwift: [String]) {
        for index in 1...countSwift.count {
            swiftList.append(columns.columnEStrings[index])
        }
    }
    
    fileprivate func createSwiftUiList(_ countSwift: [String], _ countSwiftUi: [String]) {
        for index in (countSwift.count + 1)...(countSwift.count + countSwiftUi.count) {
            swiftUiList.append(columns.columnEStrings[index])
        }
    }
    
    fileprivate func createKotlinList(_ countSwift: [String], _ countSwiftUi: [String], _ countKotlin: [String]) {
        for index in (countSwift.count + countSwiftUi.count + 1)...(countSwift.count + countSwiftUi.count + countKotlin.count) {
            kotlinList.append(columns.columnEStrings[index])
        }
    }
    
    fileprivate func createHtmlCssList(_ countSwift: [String], _ countSwiftUi: [String], _ countKotlin: [String], _ countHtmlCss: [String]) {
        for index in (countSwift.count + countSwiftUi.count + countKotlin.count + 1)...(countSwift.count + countSwiftUi.count + countKotlin.count + countHtmlCss.count) {
            htmlCssList.append(columns.columnEStrings[index])
        }
    }
    
    fileprivate func createGitList(_ countSwift: [String], _ countSwiftUi: [String], _ countKotlin: [String], _ countHtmlCss: [String], _ countGit: [String]) {
        for index in (countSwift.count + countSwiftUi.count +
            countKotlin.count + countHtmlCss.count + 1)...(countSwift.count + countSwiftUi.count +
                countKotlin.count + countHtmlCss.count + countGit.count) {
                    gitList.append(columns.columnEStrings[index])
        }
    }
    
    fileprivate func createEntrepreneuriatList(_ countSwift: [String], _ countSwiftUi: [String], _ countKotlin: [String], _ countHtmlCss: [String], _ countGit: [String], _ countEntrepreneuriat: [String]) {
        for index in (
            countSwift.count + countSwiftUi.count + countKotlin.count + countHtmlCss.count + countGit.count + 1
            )...(
                countSwift.count + countSwiftUi.count + countKotlin.count + countHtmlCss.count + countGit.count + countEntrepreneuriat.count
            ) {
                entrepreneuriatList.append(columns.columnEStrings[index])
        }
    }
    
    fileprivate func createCrossPlateformList(_ countSwift: [String], _ countSwiftUi: [String], _ countKotlin: [String], _ countHtmlCss: [String], _ countGit: [String], _ countEntrepreneuriat: [String], _ countCrossPlateform: [String]) {
        for index in (
            countSwift.count + countSwiftUi.count + countKotlin.count + countHtmlCss.count + countGit.count + countEntrepreneuriat.count + 1
            )...(
                countSwift.count + countSwiftUi.count + countKotlin.count + countHtmlCss.count + countGit.count + countEntrepreneuriat.count + countCrossPlateform.count
            ) {
                crossPlateformList.append(columns.columnEStrings[index])
        }
    }
    
    fileprivate func createOthersList(countParameters: CountParameters) {
        for index in (
            countParameters.countSwift.count + countParameters.countSwiftUi.count +
                countParameters.countKotlin.count + countParameters.countHtmlCss.count +
                countParameters.countGit.count + countParameters.countEntrepreneuriat.count +
                countParameters.countCrossPlateform.count + 1
            )...(
                countParameters.countSwift.count + countParameters.countSwiftUi.count +
                    countParameters.countKotlin.count + countParameters.countHtmlCss.count +
                    countParameters.countGit.count + countParameters.countEntrepreneuriat.count +
                    countParameters.countCrossPlateform.count + countParameters.countOthers.count
            ) {
                othersList.append(columns.columnEStrings[index])
        }
    }
    
//    fileprivate func createOthersList(_ countSwift: [String], _ countSwiftUi: [String], _ countKotlin: [String], _ countHtmlCss: [String], _ countGit: [String], _ countEntrepreneuriat: [String], _ countCrossPlateform: [String], _ countOthers: [String]) {
//        for index in (
//            countSwift.count + countSwiftUi.count + countKotlin.count + countHtmlCss.count + countGit.count + countEntrepreneuriat.count + countCrossPlateform.count + 1
//            )...(
//                countSwift.count + countSwiftUi.count + countKotlin.count + countHtmlCss.count + countGit.count + countEntrepreneuriat.count + countCrossPlateform.count + countOthers.count
//            ) {
//                othersList.append(columns.columnEStrings[index])
//        }
//    }
    
    fileprivate func setDictionnaries(_ keyParameters: KeyParameters) {
        formationsList.removeFirst()
        formationsDict = [keyParameters.keyFormation: formationsList]
        websitesList.removeFirst()
        websitesDict = [keyParameters.keyWebsite: websitesList]
        statesList.removeFirst()
        statesDict = [keyParameters.keyState: statesList]
        langagesList.removeFirst()
        langagesDict = [keyParameters.keyLangage: langagesList]
        organizationsList.removeFirst()
        organizationsDict = [keyParameters.keyOrganization: organizationsList]
        notesList.removeFirst()
        notesDict = [keyParameters.keyNote: notesList]
        detailsList.removeFirst()
        detailsDict = [keyParameters.keyDetail: detailsList]
    }
    
//    fileprivate func setDictionnaries(_ keyFormation: String, _ keyWebsite: String, _ keyState: String, _ keyLangage: String, _ keyOrganization: String, _ keyNote: String, _ keyDetail: String) {
//        formationsList.removeFirst()
//        formationsDict = [keyFormation: formationsList]
//        websitesList.removeFirst()
//        websitesDict = [keyWebsite: websitesList]
//        statesList.removeFirst()
//        statesDict = [keyState: statesList]
//        langagesList.removeFirst()
//        langagesDict = [keyLangage: langagesList]
//        organizationsList.removeFirst()
//        organizationsDict = [keyOrganization: organizationsList]
//        notesList.removeFirst()
//        notesDict = [keyNote: notesList]
//        detailsList.removeFirst()
//        detailsDict = [keyDetail: detailsList]
//    }
    
    fileprivate func createOrganizationsDict() {
        organizationsDict = [
            Constants.Swift: swiftList.removingDuplicates(),
            Constants.SwiftUi: swiftUiList.removingDuplicates(),
            Constants.Kotlin: kotlinList.removingDuplicates(),
            Constants.HtmlCss: htmlCssList.removingDuplicates(),
            Constants.Git: gitList.removingDuplicates(),
            Constants.Entrepreneuriat: entrepreneuriatList.removingDuplicates(),
            Constants.CrossPlateform: crossPlateformList.removingDuplicates(),
            Constants.Others: othersList.removingDuplicates()
        ]
    }
    
//    func createListsOrganizations() {
//        for index in 1...32 {
//            organizationsList.append(columns.columnEStrings[index])
//        }
//        // Swift
//        for index in 1...5 {
//            udemyList.append(columns.columnAStrings[index])
//        }
//        //SwiftUI
//        udemyList.append(columns.columnAStrings[21])
//        // Kotlin
//        udemyList.append(columns.columnAStrings[24])
//        // HTML-CSS
//        udemyList.append(columns.columnAStrings[27])
//
//        // Swift
//        for index in 6...7 {
//            hwsList.append(columns.columnAStrings[index])
//        }
//        // SwiftUI
//        for index in 22...23 {
//            hwsList.append(columns.columnAStrings[index])
//        }
//
//        // Swift
//        for index in 8...10 {
//            courseraList.append(columns.columnAStrings[index])
//        }
//        // Entrepreneuriat
//        courseraList.append(columns.columnAStrings[30])
//
//        // Swift
//        swiftOrgList.append(columns.columnAStrings[11])
//
//        // Swift
//        for index in 12...16 {
//            purpleGiraffeList.append(columns.columnAStrings[index])
//        }
//        // Kotlin
//        for index in 25...26 {
//            purpleGiraffeList.append(columns.columnAStrings[index])
//        }
//        // Cross-Plateform
//        purpleGiraffeList.append(columns.columnAStrings[31])
//
//        // Swift
//        cwcList.append(columns.columnAStrings[17])
//        codinGameList.append(columns.columnAStrings[18])
//        microsoftList.append(columns.columnAStrings[19])
//        raywenderlichList.append(columns.columnAStrings[20])
//
//        // Git
//        learnGitBranchingList.append(columns.columnAStrings[28])
//        // Entrepreneuriat
//        openClassroomsList.append(columns.columnAStrings[30])
//        // Others
//        diversList.append(columns.columnAStrings[32])
//    }
    
//    func setOrganizationsDict() {
//        organizationsDict = [
//            Constants.Udemy: udemyList,
//            Constants.Hws: hwsList,
//            Constants.Coursera: courseraList,
//            Constants.SwiftOrg: swiftOrgList,
//            Constants.PurpleGiraffe: purpleGiraffeList,
//            Constants.Cwc: cwcList,
//            Constants.CodinGame: codinGameList,
//            Constants.Microsoft: microsoftList,
//            Constants.Raywenderlich: raywenderlichList,
//            Constants.LearnGitBranching: learnGitBranchingList,
//            Constants.OpenClassrooms: openClassroomsList,
//            Constants.Divers: diversList
//        ]
//    }
    
    /// function to debug dictionnaries
    fileprivate func debugDicts() {
        print(formationsDict)
        print(websitesDict)
        print(statesDict)
        print(langagesDict)
        print(organizationsDict)
        print(notesDict)
        print(detailsDict)
    }
    
    /// function to debug list
    fileprivate func debugLists() {
        print(formationsList)
        print(websitesList)
        print(statesList)
        print(langageNamesList)
        print(organizationsList)
        print(notesList)
        print(detailsList)
    }
    
    /// function to debug langagesList
    fileprivate func debugLangagesList() {
        print("swiftList : \(swiftList)")
        print("swiftUiList : \(swiftUiList)")
        print("kotlinList : \(kotlinList)")
        print("htmlCssList : \(htmlCssList)")
        print("gitList : \(gitList)")
        print("entrepreneuriatList : \(entrepreneuriatList)")
        print("crossPlateformList : \(crossPlateformList)")
        print("othersList : \(othersList)")
    }
    
    fileprivate func debugListCount(_ countSwift: [String], _ countSwiftUi: [String], _ countKotlin: [String], _ countHtmlCss: [String], _ countGit: [String], _ countEntrepreneuriat: [String], _ countCrossPlateform: [String], _ countOthers: [String]) {
        print(countSwift.count)
        print(countSwiftUi.count)
        print(countKotlin.count)
        print(countHtmlCss.count)
        print(countGit.count)
        print(countEntrepreneuriat.count)
        print(countCrossPlateform.count)
        print(countOthers.count)
    }
    
    /// function to debug the list
//    func debugCreateList() {
//        print("allDict : \(allDict)")
//        print("allList : \(allList)")
//        print("swiftList : \(swiftList)")
//        print("swiftUiList : \(swiftUiList)")
//        print("kotlinList : \(kotlinList)")
//        print("htmlCssList : \(htmlCssList)")
//        print("gitList : \(gitList)")
//        print("entrepreneuriatList : \(entrepreneuriatList)")
//        print("crossPlateformList : \(crossPlateformList)")
//        print("othersList : \(othersList)")
//
//        print("organizationsDict : \(organizationsDict) \(organizationsDict.count)")
//        print("organizationsList : \(organizationsList.removingDuplicates()) \(organizationsList.removingDuplicates().count)")
//        print("udemyList : \(udemyList) \(udemyList.count)")
//        print("hwsList : \(hwsList) \(hwsList.count)")
//        print("courseraList : \(courseraList) \(courseraList.count)")
//        print("swiftOrgList : \(swiftOrgList) \(swiftOrgList.count)")
//        print("purpleGiraffeList : \(purpleGiraffeList) \(purpleGiraffeList.count)")
//        print("cwcList : \(cwcList) \(cwcList.count)")
//        print("codinGameList : \(codinGameList) \(codinGameList.count)")
//        print("microsoftList : \(microsoftList) \(microsoftList.count)")
//        print("raywenderlichList : \(raywenderlichList) \(raywenderlichList.count)")
//        print("learnGitBranchingList : \(learnGitBranchingList) \(learnGitBranchingList.count)")
//        print("openClassroomsList : \(openClassroomsList) \(openClassroomsList.count)")
//        print("diversList : \(diversList) \(diversList.count)")
////        print("columns.columnAStrings : \(columns.columnAStrings)")
//
//    }
    
    /// debug rows and cell of worksheet
    private func debugWorksheetRowsAndColumns(_ file: XLSXFile, _ worksheet: Worksheet) throws {
//        print(worksheet)
        let sharedStrings = try file.parseSharedStrings()
        print("??? worksheet.data?.rows[0].cells[0].stringValue(sharedStrings) : \(worksheet.data?.rows[0].cells[0].stringValue(sharedStrings) ?? "error")")
//        print("worksheet.data?.rows : \(String(describing: worksheet.data?.rows))")
        print("worksheet.data?.rows[0].cells[1].stringValue(sharedStrings) : \(String(describing: worksheet.data?.rows[0].cells[1].stringValue(sharedStrings)))")
        print("worksheet.data?.rows[0] : \(String(describing: worksheet.data?.rows[0]))")
        print("worksheet.data?.rows[1] : \(String(describing: worksheet.data?.rows[1]))")
        print("worksheet.data?.rows[2] : \(String(describing: worksheet.data?.rows[2]))")
        for row in worksheet.data?.rows ?? [] {
            for item in row.cells { // where row.reference == 7
                    print("row.cells.description => item.stringValue(sharedStrings) : \(String(describing: item.stringValue(sharedStrings)))")
                    print("item : \(item)")
                    print("item.stringValue(sharedStrings) : \(String(describing: item.stringValue(sharedStrings)))")
                let rowReference = row.reference
                var index = 1
                if rowReference == index {
                    let item = item.stringValue(sharedStrings)
                     switch item {
                     case "Udemy":
                         print("Udemy : \(item ?? ""))")
                     case "Hacking with Swift":
                         print("Hacking with Swift : \(item ?? "")")
                     case "Coursera":
                         print("Coursera : \(item ?? "")")
                     case "Swift.org":
                         print("Swift.org : \(item ?? "")")
                     case "Purple Giraffe":
                         print("Purple Giraffe : \(item ?? "")")
                     case "CodeWithChris":
                         print("CodeWithChris : \(item ?? "")")
                     case "CodinGame":
                         print("CodinGame : \(item ?? "")")
                     case "Microsoft":
                         print("Microsoft : \(item ?? "")")
                     case "Raywenderlich":
                         print("Raywenderlich : \(item ?? "")")
                     case "LearnGitBranching":
                         print("LearnGitBranching : \(item ?? "")")
                     case "OpenClassrooms":
                         print("OpenClassrooms : \(item ?? "")")
                     default:
                         print("Divers : \(item ?? "")")
                     }
                }
                index += 1
//                if item.stringValue(sharedStrings) == "Udemy" {
//                    print("Udemy : \(item.stringValue(sharedStrings))")
//                } else if item.stringValue(sharedStrings) == "Coursera" {
//                    print("Coursera : \(item.stringValue(sharedStrings))")
//                }
                
//                let sharedStrings = try file.parseSharedStrings()
//                for row in worksheet.data?.rows ?? [] {
//                    for item in row.cells where row.cells.description == "A1" {
//                            print("row.cells.description => item.stringValue(sharedStrings) : \(String(describing: item.stringValue(sharedStrings)))")
//                            print("item : \(item)")
//                            print("item.stringValue(sharedStrings) : \(String(describing: item.stringValue(sharedStrings)))")
//                    }
//                }
//
//                allList.append(worksheet.data?.rows[1].cells[0].stringValue(sharedStrings) ?? "nil")
//                print("worksheet.data?.rows[0].cells[0].stringValue(sharedStrings) : \(worksheet.data?.rows[1].cells[0].stringValue(sharedStrings) ?? "error")")
//                print("worksheet.data?.rows[0].cells[1].stringValue(sharedStrings) : \(worksheet.data?.rows[1].cells[1].stringValue(sharedStrings) ?? "error")")
//                print("worksheet.data?.rows[0].cells[2].stringValue(sharedStrings) : \(worksheet.data?.rows[1].cells[2].stringValue(sharedStrings) ?? "error")")
//                print("worksheet.data?.rows[0].cells[3].stringValue(sharedStrings) : \(worksheet.data?.rows[1].cells[3].stringValue(sharedStrings) ?? "error")")

            }
        }

//        print("columns.columnAStrings : \(columns.columnAStrings)")
    }
}
