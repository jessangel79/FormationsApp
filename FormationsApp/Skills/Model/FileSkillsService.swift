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
    private var rowsCount = Int()
    private var formationsList = [String]()
    private var knowledgesList = [String]()
    private var degreesList = [String]()
    private var knowledgeTitlesList = [String]()
    private var linksList = [String]()
    
    // MARK: - Struct to Columns of xlsx file
    
    private struct Columns {
        var columnASkillsStr = [String]()
        var columnBSkillsStr = [String]()
        var columnCSkillsStr = [String]()
        var columnDSkillsStr = [String]()
        var columnESkillsStr = [String]()
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
                createLists()
                createAllSkillsList()
//                debugLists()
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
    private func createLists() {
        formationsList = columns.columnASkillsStr
        knowledgesList = columns.columnBSkillsStr
        degreesList = columns.columnCSkillsStr
        knowledgeTitlesList = columns.columnDSkillsStr
        linksList = columns.columnESkillsStr
    }
    
    private func removeTitleColums() {
        formationsList.removeFirst()
        knowledgesList.removeFirst()
        degreesList.removeFirst()
        knowledgeTitlesList.removeFirst()
        linksList.removeFirst()
    }
    
    /// create a list with struct langages and all lists of items
    private func createAllSkillsList() {
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

//extension FileSkillsService {
//    
//    /// function to debug list
//    private func debugLists() {
//        print("worksheet.data?.rows.count - rowsCount : \(rowsCount)")
//        print("allSkillsList : \(allSkillsList)")
//        print("allSkillsList count : \(allSkillsList.count)")
//        print("formationsList : \(formationsList)")
//        print("formationsList COUNT : \(formationsList.count)")
//        print("knowledgesList : \(knowledgesList)")
//        print("degreesList : \(degreesList)")
//        print("knowledgeTitlesList : \(knowledgeTitlesList)")
//        print("linksList : \(linksList)")
//    }
//}
