//
//  FileStudiesService.swift
//  FormationsApp
//
//  Created by Angelique Babin on 10/07/2020.
//  Copyright © 2020 Angelique Babin. All rights reserved.
//

import Foundation
import CoreXLSX

final class FileStudiesService {
    
    // MARK: - Vars

    private var columns = Columns()
    var allSkillsList = [Skills]()
    var rowsCount = Int()
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
                debugLists()
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

extension FileStudiesService {

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
}

// MARK: - Extension to debug lists and dictionnaries

extension FileStudiesService {
    
    /// function to debug list
    fileprivate func debugLists() {
        print("worksheet.data?.rows.count - rowsCount : \(rowsCount)")
        print("allSkillsList : \(allSkillsList)")
        print("allSkillsList count : \(allSkillsList.count)")
        print("formationsList : \(formationsList)")
        print("formationsList COUNT : \(formationsList.count)")
        print("knowledgesList : \(knowledgesList)")
        print("degreesList : \(degreesList)")
        print("knowledgeTitlesList : \(knowledgeTitlesList)")
        print("linksList : \(linksList)")
    }
}
