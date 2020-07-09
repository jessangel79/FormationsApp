//
//  FileSkillsService.swift
//  FormationsApp
//
//  Created by Angelique Babin on 08/07/2020.
//  Copyright © 2020 Angelique Babin. All rights reserved.
//

import Foundation
import CoreXLSX

final class FileSkillsService {
    
    // MARK: - Vars

    private var columns = Columns()
    var allSkillsList = [Skills]()
//    var allSkillsDict = [String: [Skills]]()
//    var allFileList = [Langages]()
//    var allFileDict = [String: [Langages]]()

    var rowsCount = Int()
//    var rowsCountSwift = Int()
//    var rowsCountSwiftUi = Int()
//    var rowsCountKotlin = Int()
//    var rowsCountHtmlCss = Int()
//    var rowsCountGit = Int()
//    var rowsCountEntrepreneuriat = Int()
//    var rowsCountCrossPlateform = Int()
//    var rowsCountOthers = Int()

    var formationsList = [String]()
    var knowledgesList = [String]()
    var degreesList = [String]()
    var knowledgeTitlesList = [String]()
    var linksList = [String]()

    // MARK: - Methods
    
    func parseFile(_ file: XLSXFile) throws {
        for wbk in try file.parseWorkbooks() {
            for (name, path) in try file.parseWorksheetPathsAndNames(workbook: wbk) {
                if let worksheetName = name {
                    print("This worksheet has a name: \(worksheetName)")
                }
                let worksheet = try file.parseWorksheet(at: path)
                let sharedStrings = try file.parseSharedStrings()
                rowsCount = worksheet.data?.rows.count ?? 0
                setColumnsFile(file: file, worksheet: worksheet)
                createLists(worksheet, sharedStrings)
                createAllSkillsList()
//                getCountListLangages()
//                createAllFiledict()
                debugLists()
//                debugCountLangage()
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

            columns.columnASkillsStr = worksheet.cells(atColumns: [columnA])
                .compactMap { $0.stringValue(sharedStrings) }
            columns.columnBSkillsStr = worksheet.cells(atColumns: [columnB])
                .compactMap { $0.stringValue(sharedStrings) }
            columns.columnCSkillsStr = worksheet.cells(atColumns: [columnC])
                .compactMap { $0.stringValue(sharedStrings) }
            columns.columnDSkillsStr = worksheet.cells(atColumns: [columnD])
                .compactMap { $0.stringValue(sharedStrings) }
            columns.columnESkillsStr = worksheet.cells(atColumns: [columnE])
                .compactMap { $0.stringValue(sharedStrings) }
        } catch {
            print("error : \(error.localizedDescription)")
        }
    }
}

// MARK: - Extension to create lists and dictionnaries

extension FileSkillsService {

    /// create lists of items
    fileprivate func createLists(_ worksheet: Worksheet, _ sharedStrings: SharedStrings) {
        for row in worksheet.data?.rows ?? [] {
            formationsList.append(row.cells[0].stringValue(sharedStrings) ?? "")
            knowledgesList.append(row.cells[1].stringValue(sharedStrings) ?? "")
            degreesList.append(row.cells[2].stringValue(sharedStrings) ?? "")
            knowledgeTitlesList.append(row.cells[3].stringValue(sharedStrings) ?? "")
            linksList.append(row.cells[4].stringValue(sharedStrings) ?? "")
        }
    }
    
    fileprivate func removeTitleColums() {
        formationsList.removeFirst()
        knowledgesList.removeFirst()
        degreesList.removeFirst()
        knowledgeTitlesList.removeFirst()
        linksList.removeFirst()
    }
    
    /// create a list with struct langages and all lists of items
    fileprivate func createAllSkillsList() {
        removeTitleColums()
        for index in 0...rowsCount - 2 {
            allSkillsList.append(Skills(formation: formationsList[index],
                                        knowledge: knowledgesList[index],
                                        degree: degreesList[index],
                                        knowledgeTitle: knowledgeTitlesList[index],
                                        link: linksList[index]))
        }
    }
    
//    fileprivate func getCountLangage(langage: String) {
//        var array = [String]()
//        for langage in langagesList {
//            switch langage {
//            case Constants.Swift:
//                array.append(langage)
//                rowsCountSwift = array.count
//            case Constants.SwiftUi:
//                array.append(langage)
//                rowsCountSwiftUi = array.count
//            case Constants.Kotlin:
//                array.append(langage)
//                rowsCountKotlin = array.count
//            case Constants.HtmlCss:
//                array.append(langage)
//                rowsCountHtmlCss = array.count
//            case Constants.Git:
//                array.append(langage)
//                rowsCountGit = array.count
//            case Constants.Entrepreneuriat:
//                array.append(langage)
//                rowsCountEntrepreneuriat = array.count
//            case Constants.CrossPlateform:
//                array.append(langage)
//                rowsCountCrossPlateform = array.count
//            default:
//                array.append(langage)
//                rowsCountOthers = array.count
//            }
//        }
//    }
    
//    fileprivate func getCountListLangages() {
//        getCountLangage(langage: Constants.Swift)
//        getCountLangage(langage: Constants.SwiftUi)
//        getCountLangage(langage: Constants.Kotlin)
//        getCountLangage(langage: Constants.HtmlCss)
//        getCountLangage(langage: Constants.Git)
//        getCountLangage(langage: Constants.Entrepreneuriat)
//        getCountLangage(langage: Constants.CrossPlateform)
//        getCountLangage(langage: Constants.Others)
//    }
    
//    fileprivate func returnArray(min: Int, max: Int) -> [Langages] {
//        var array = [Langages]()
//        for index in min...max {
//            array.append(allFileList[index])
//        }
//        return array
//    }

//    fileprivate func createAllFiledict() {
//        let arraySwift = returnArray(min: 0, max: rowsCountSwift-1)
//        let arraySwiftUi = returnArray(min: rowsCountSwift, max: rowsCountSwiftUi-1)
//        let arrayKotlin = returnArray(min: rowsCountSwiftUi, max: rowsCountKotlin-1)
//        let arrayHtmlCss = returnArray(min: rowsCountKotlin, max: rowsCountHtmlCss-1)
//        let arrayGit = returnArray(min: rowsCountHtmlCss, max: rowsCountGit-1)
//        let arrayEntrepreneuriat = returnArray(min: rowsCountGit, max: rowsCountEntrepreneuriat-1)
//        let arrayCrossPlateform = returnArray(min: rowsCountEntrepreneuriat, max: rowsCountCrossPlateform-1)
//        let arrayOthers = returnArray(min: rowsCountCrossPlateform, max: rowsCountOthers-1)
//        allFileDict = [
//            Constants.Swift: arraySwift, Constants.SwiftUi: arraySwiftUi,
//            Constants.Kotlin: arrayKotlin, Constants.HtmlCss: arrayHtmlCss,
//            Constants.Git: arrayGit, Constants.Entrepreneuriat: arrayEntrepreneuriat,
//            Constants.CrossPlateform: arrayCrossPlateform, Constants.Others: arrayOthers
//        ]
//    }
}

// MARK: - Extension to debug lists and dictionnaries

extension FileSkillsService {
    
    /// function to debug list
    fileprivate func debugLists() {
        print("worksheet.data?.rows.count - rowsCount : \(rowsCount)")
//        print("rowsCountSwift : \(rowsCountSwift)")
//        print("rowsCountSwiftUi : \(rowsCountSwiftUi)")
//        print("rowsCountKotlin : \(rowsCountKotlin)")
//        print("rowsCountHtmlCss : \(rowsCountHtmlCss)")
//        print("rowsCountGit : \(rowsCountGit)")
//        print("rowsCountCrossPlateform : \(rowsCountCrossPlateform)")
//        print("rowsCountEntrepreneuriat : \(rowsCountEntrepreneuriat)")
//        print("rowsCountOthers : \(rowsCountOthers)")

        print("allSkillsList : \(allSkillsList)")
        print("allSkillsList count : \(allSkillsList.count)")
//        print("allFileDict : \(allFileDict)")
        print("formationsList : \(formationsList)")
        print("formationsList COUNT : \(formationsList.count)")

        print("knowledgesList : \(knowledgesList)")
        print("degreesList : \(degreesList)")
        print("knowledgeTitlesList : \(knowledgeTitlesList)")
        print("linksList : \(linksList)")
    }
    
//    fileprivate func debugCountLangage() {
//        print("rowsCountSwift : \(rowsCountSwift)")
//        print("rowsCountSwiftUi : \(rowsCountSwiftUi)")
//        print("rowsCountKotlin : \(rowsCountKotlin)")
//        print("rowsCountHtmlCss : \(rowsCountHtmlCss)")
//        print("rowsCountGit : \(rowsCountGit)")
//        print("rowsCountEntrepreneuriat : \(rowsCountEntrepreneuriat)")
//        print("rowsCountCrossPlateform : \(rowsCountCrossPlateform)")
//        print("rowsCountOthers : \(rowsCountOthers)")
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
        print("allFileList[0].formations : \(allSkillsList[0].formation)")
        print("allFileList[0] : \(allSkillsList[0])")
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
            }
        }
    }
}
