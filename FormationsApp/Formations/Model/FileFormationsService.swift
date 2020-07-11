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

    private var columns = Columns()
    var allFileList = [Themes]()
    var allFileDict = [String: [Themes]]()

    var rowsCount = Int()
    var rowsCountSwift = Int()
    var rowsCountSwiftUi = Int()
    var rowsCountKotlin = Int()
    var rowsCountHtmlCss = Int()
    var rowsCountGit = Int()
    var rowsCountEntrepreneuriat = Int()
    var rowsCountCrossPlateform = Int()
    var rowsCountOthers = Int()

    var formationsList = [String]()
    var websitesList = [String]()
    var statesList = [String]()
    var themesList = [String]()
    var organizationsList = [String]()
    var notesList = [String]()
    var detailsList = [String]()
    var startDatesList = [String]()
    var endDatesList = [String]()

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
                setDateColumnsFile(file: file, worksheet: worksheet)
                createLists(worksheet, sharedStrings)
                createAllFileList()
                getCountListThemes()
                createAllFiledict()
                debugLists()
                debugCountLangage()
//                try debugWorksheetRowsAndColumns(file, worksheet)
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
    
    private func setDateColumnsFile(file: XLSXFile, worksheet: Worksheet) {
        guard let columnHDates = Constants.columnHDates else { return }
        columns.columnHDates = worksheet.cells(atColumns: [columnHDates])
            .compactMap { $0.dateValue }
    }
}

// MARK: - Extension to create lists and dictionnaries

extension FileFormationsService {

    /// create lists of items
    fileprivate func createLists(_ worksheet: Worksheet, _ sharedStrings: SharedStrings) {
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
    
    fileprivate func removeTitleColums() {
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
    fileprivate func createAllFileList() {
        removeTitleColums()
        for index in 0...rowsCount - 2 { // - 2
            allFileList.append(Themes(formation: formationsList[index],
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
    
    fileprivate func getCountTheme(theme: String) {
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
    
    fileprivate func getCountListThemes() {
        getCountTheme(theme: Constants.Swift)
        getCountTheme(theme: Constants.SwiftUi)
        getCountTheme(theme: Constants.Kotlin)
        getCountTheme(theme: Constants.HtmlCss)
        getCountTheme(theme: Constants.Git)
        getCountTheme(theme: Constants.Entrepreneuriat)
        getCountTheme(theme: Constants.CrossPlateform)
        getCountTheme(theme: Constants.Others)
    }
    
    fileprivate func returnArray(min: Int, max: Int) -> [Themes] {
        var array = [Themes]()
        for index in min...max {
            array.append(allFileList[index])
        }
        return array
    }

    fileprivate func createAllFiledict() {
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
