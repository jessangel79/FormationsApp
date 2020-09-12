//
//  FileFormationsService.swift
//  FormationsApp
//
//  Created by Angelique Babin on 26/06/2020.
//  Copyright © 2020 Angelique Babin. All rights reserved.
//

import Foundation
import CoreXLSX

final class FileFormationsService {
    
    // MARK: - Vars

    private var allFileList = [Formations]()
    var allFileDict = [String: [Formations]]()

    private var rowsCount = Int()
    private var rowsCountSwift = Int()
    private var rowsCountSwiftUi = Int()
    private var rowsCountKotlin = Int()
    private var rowsCountHtmlCss = Int()
    private var rowsCountGit = Int()
    private var rowsCountEntrepreneuriat = Int()
    private var rowsCountCrossPlateform = Int()
    private var rowsCountOthers = Int()

    private var formationsList = [String]()
    private var websitesList = [String]()
    private var statesList = [String]()
    var themesList = [String]()
    private var organizationsList = [String]()
    private var notesList = [String]()
    private var detailsList = [String]()
    private var startDatesList = [String]()
    private var endDatesList = [String]()

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
                setLists(worksheet, sharedStrings)
                createAllFileList()
                getCountListThemes()
                createAllFiledict()
//                debugLists()
//                debugCountTheme()
//                try debugWorksheetRowsAndColumns(file, worksheet)
            }
        }
    }
    
    /// set lists of items
    private func setLists(_ worksheet: Worksheet, _ sharedStrings: SharedStrings) {
        for row in worksheet.data?.rows ?? [] {
            formationsList.append(row.cells[0].stringValue(sharedStrings) ?? "")
            websitesList.append(row.cells[1].stringValue(sharedStrings) ?? "")
            statesList.append(row.cells[2].stringValue(sharedStrings) ?? Constants.ToDo)
            themesList.append(row.cells[3].stringValue(sharedStrings) ?? "")
            organizationsList.append(row.cells[4].stringValue(sharedStrings) ?? "")
            notesList.append(row.cells[5].stringValue(sharedStrings) ?? "")
            detailsList.append(row.cells[6].stringValue(sharedStrings) ?? "")
            let startDate = row.cells[7].dateValue?.toString() ?? ""
            startDatesList.append(startDate)
            let endDate = row.cells[8].dateValue?.toString() ?? ""
            endDatesList.append(endDate)
        }
    }
}

// MARK: - Extension to create lists and dictionnaries

extension FileFormationsService {

    private func removeTitleColums() {
        formationsList.removeFirst()
        websitesList.removeFirst()
        statesList.removeFirst()
        themesList.removeFirst()
        organizationsList.removeFirst()
        notesList.removeFirst()
        detailsList.removeFirst()
        startDatesList.removeFirst()
        endDatesList.removeFirst()
    }
    
    /// create a list with struct langages and all lists of items
    private func createAllFileList() {
        removeTitleColums()
        for index in 0...rowsCount - 2 {
            allFileList.append(Formations(formation: formationsList[index],
                                    webSite: websitesList[index],
                                    state: statesList[index],
                                    theme: themesList[index],
                                    organization: organizationsList[index],
                                    note: notesList[index],
                                    detail: detailsList[index],
                                    startDate: startDatesList[index],
                                    endDate: endDatesList[index]))
        }
    }
    
    private func getCountTheme(theme: String) {
        var array = [String]()
        for theme in themesList {
            switch theme {
            case Constants.Swift:
                array.append(theme)
                rowsCountSwift = array.count
            case Constants.SwiftUi:
                array.append(theme)
                rowsCountSwiftUi = array.count
            case Constants.Kotlin:
                array.append(theme)
                rowsCountKotlin = array.count
            case Constants.HtmlCss:
                array.append(theme)
                rowsCountHtmlCss = array.count
            case Constants.Git:
                array.append(theme)
                rowsCountGit = array.count
            case Constants.Entrepreneuriat:
                array.append(theme)
                rowsCountEntrepreneuriat = array.count
            case Constants.CrossPlateform:
                array.append(theme)
                rowsCountCrossPlateform = array.count
            default:
                array.append(theme)
                rowsCountOthers = array.count
            }
        }
    }
    
    private func getCountListThemes() {
        getCountTheme(theme: Constants.Swift)
        getCountTheme(theme: Constants.SwiftUi)
        getCountTheme(theme: Constants.Kotlin)
        getCountTheme(theme: Constants.HtmlCss)
        getCountTheme(theme: Constants.Git)
        getCountTheme(theme: Constants.Entrepreneuriat)
        getCountTheme(theme: Constants.CrossPlateform)
        getCountTheme(theme: Constants.Others)
    }
    
    private func returnArray(min: Int, max: Int) -> [Formations] {
        var array = [Formations]()
        for index in min...max {
            array.append(allFileList[index])
        }
        return array
    }

    private func createAllFiledict() {
        let arraySwift = returnArray(min: 0, max: rowsCountSwift-1)
        let arraySwiftUi = returnArray(min: rowsCountSwift, max: rowsCountSwiftUi-1)
        let arrayKotlin = returnArray(min: rowsCountSwiftUi, max: rowsCountKotlin-1)
        let arrayHtmlCss = returnArray(min: rowsCountKotlin, max: rowsCountHtmlCss-1)
        let arrayGit = returnArray(min: rowsCountHtmlCss, max: rowsCountGit-1)
        let arrayEntrepreneuriat = returnArray(min: rowsCountGit, max: rowsCountEntrepreneuriat-1)
        let arrayCrossPlateform = returnArray(min: rowsCountEntrepreneuriat, max: rowsCountCrossPlateform-1)
        let arrayOthers = returnArray(min: rowsCountCrossPlateform, max: rowsCountOthers-1)
        allFileDict = [
            Constants.Swift: arraySwift, Constants.SwiftUi: arraySwiftUi,
            Constants.Kotlin: arrayKotlin, Constants.HtmlCss: arrayHtmlCss,
            Constants.Git: arrayGit, Constants.Entrepreneuriat: arrayEntrepreneuriat,
            Constants.CrossPlateform: arrayCrossPlateform, Constants.Others: arrayOthers
        ]
    }
}

// MARK: - Extension to debug lists and dictionnaries

extension FileFormationsService {
    
    /// function to debug list
    private func debugLists() {
        print("worksheet.data?.rows.count - rowsCount : \(rowsCount)")
        print("allFileList : \(allFileList)")
        print("allFileDict : \(allFileDict)")
        print("formationsList : \(formationsList)")
        print("formationsList COUNT : \(formationsList.count)")

        print("websitesList : \(websitesList)")
        print("statesList : \(statesList)")
        print("themesList : \(themesList)")
        print("organizationsList : \(organizationsList)")
        print("notesList : \(notesList)")
        print("detailsList : \(detailsList)")
        print("allFileList count : \(allFileList.count)")
        print("startDatesList : \(startDatesList)")
        print("endDatesList : \(endDatesList)")
        print("startDatesList COUNT : \(startDatesList.count)")
        print("endDatesList COUNT : \(endDatesList.count)")
    }
    
    private func debugCountTheme() {
        print("rowsCountSwift : \(rowsCountSwift)")
        print("rowsCountSwiftUi : \(rowsCountSwiftUi)")
        print("rowsCountKotlin : \(rowsCountKotlin)")
        print("rowsCountHtmlCss : \(rowsCountHtmlCss)")
        print("rowsCountGit : \(rowsCountGit)")
        print("rowsCountEntrepreneuriat : \(rowsCountEntrepreneuriat)")
        print("rowsCountCrossPlateform : \(rowsCountCrossPlateform)")
        print("rowsCountOthers : \(rowsCountOthers)")
    }
    
    /// debug rows and cell of worksheet
    private func debugWorksheetRowsAndColumns(_ file: XLSXFile, _ worksheet: Worksheet) throws {
        let sharedStrings = try file.parseSharedStrings()
        print("worksheet.data?.rows[0].cells[0].stringValue(sharedStrings) : \(String(describing: worksheet.data?.rows[0].cells[0].stringValue(sharedStrings)))")
        print("worksheet.data?.rows[0].cells[1].stringValue(sharedStrings) : \(String(describing: worksheet.data?.rows[0].cells[1].stringValue(sharedStrings)))")
        for row in worksheet.data?.rows ?? [] {
            for item in row.cells {
                    print("row.cells.description => item.stringValue(sharedStrings) : \(String(describing: item.stringValue(sharedStrings)))")
                    print("item : \(item)")
                    print("item.stringValue(sharedStrings) : \(String(describing: item.stringValue(sharedStrings)))")
                print("row.reference :\(row.reference)")
            }
        }
    }
}
