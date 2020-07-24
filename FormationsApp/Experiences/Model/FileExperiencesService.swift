//
//  FileExperiencesService.swift
//  FormationsApp
//
//  Created by Angelique Babin on 10/07/2020.
//  Copyright © 2020 Angelique Babin. All rights reserved.
//

import Foundation
import CoreXLSX

final class FileExperiencesService {

    // MARK: - Vars

    private var columns = Columns()
    var allExperiencesList = [Experiences]()
    private var rowsCount = Int()
    var experiencesList = [String]()
    private var companiesList = [String]()
    private var startDatesList = [String]()
    private var endDatesList = [String]()
    private var linksList = [String]()

    // MARK: - Struct to Columns of xlsx file

    private struct Columns {
        var columnAExperiencesStr = [String]()
        var columnBExperiencesStr = [String]()
        var columnCExperiencesDates = [Date]()
        var columnDExperiencesDates = [Date]()
        var columnEExperiencesStr = [String]()
    }

    // MARK: - Methods

    func parseFile(_ file: XLSXFile) throws {
        for wbk in try file.parseWorkbooks() {
            for (name, path) in try file.parseWorksheetPathsAndNames(workbook: wbk) {
                if let worksheetName = name {
                    print("This worksheet has a name: \(worksheetName)")
                }
                let worksheet = try file.parseWorksheet(at: path)
                rowsCount = worksheet.data?.rows.count ?? 0
                setColumnsFile(file: file, worksheet: worksheet)
                createAllStudiesList()
//                debugLists()
            }
        }
    }

    private func setColumnsFile(file: XLSXFile, worksheet: Worksheet) {
        do {
            let sharedStrings = try file.parseSharedStrings()
            guard let columnA = Constants.columnA else { return }
            guard let columnB = Constants.columnB else { return }
            guard let columnE = Constants.columnE else { return }

            columns.columnAExperiencesStr = worksheet.cells(atColumns: [columnA])
                .compactMap { $0.stringValue(sharedStrings) }
            columns.columnBExperiencesStr = worksheet.cells(atColumns: [columnB])
                .compactMap { $0.stringValue(sharedStrings) }
            columns.columnEExperiencesStr = worksheet.cells(atColumns: [columnE])
                .compactMap { $0.stringValue(sharedStrings) }
            setDatesLists(worksheet)
            createLists()
        } catch {
            print("error : \(error.localizedDescription)")
        }
    }

    private func setDatesLists(_ worksheet: Worksheet) {
        for row in worksheet.data?.rows ?? [] {
            let startDate = row.cells[2].dateValue?.toString() ?? ""
            startDatesList.append(startDate)
            let endDate = row.cells[3].dateValue?.toString() ?? ""
            endDatesList.append(endDate)
        }
    }
}

// MARK: - Extension to create lists and dictionnaries

extension FileExperiencesService {

    /// create lists of items
    private func createLists() {
        experiencesList = columns.columnAExperiencesStr
        companiesList = columns.columnBExperiencesStr
        linksList = columns.columnEExperiencesStr
    }

    private func removeTitleColums() {
        experiencesList.removeFirst()
        companiesList.removeFirst()
        linksList.removeFirst()
        startDatesList.removeFirst()
        endDatesList.removeFirst()
    }

    /// create a list with struct langages and all lists of items
    private func createAllStudiesList() {
        removeTitleColums()
        for index in 0...rowsCount - 2 {
            allExperiencesList.append(Experiences(experience: experiencesList[index],
                                                  company: companiesList[index],
                                                  startDate: startDatesList[index],
                                                  endDate: endDatesList[index],
                                                  link: linksList[index]))
        }
    }
}

// MARK: - Extension to debug lists and dictionnaries

extension FileExperiencesService {

    /// function to debug list
    private func debugLists() {
        print("worksheet.data?.rows.count - rowsCount : \(rowsCount)")
        print("allExperiencesList : \(allExperiencesList)")
        print("allExperiencesList count : \(allExperiencesList.count)")
        print("experiencesList : \(experiencesList)")
        print("experiencesList COUNT : \(experiencesList.count)")
        print("companiesList : \(companiesList)")
        print("linksList : \(linksList)")
        print("startDatesList : \(startDatesList)")
        print("endDatesList : \(endDatesList)")
    }
}
