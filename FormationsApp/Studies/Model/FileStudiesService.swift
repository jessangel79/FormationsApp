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
    var allStudiesList = [Studies]()
    private var rowsCount = Int()
    var certificationsList = [String]()
    private var organizationsList = [String]()
    private var linksList = [String]()
    private var themesList = [String]()
    private var datesList = [String]()
    
    // MARK: - Struct to Columns of xlsx file
    
    private struct Columns {
        var columnAStudiesStr = [String]()
        var columnBStudiesStr = [String]()
        var columnCStudiesStr = [String]()
        var columnDStudiesStr = [String]()
        var columnEStudiesDates = [Date]()
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

            columns.columnAStudiesStr = worksheet.cells(atColumns: [columnA])
                .compactMap { $0.stringValue(sharedStrings) }
            columns.columnBStudiesStr = worksheet.cells(atColumns: [columnB])
                .compactMap { $0.stringValue(sharedStrings) }
            columns.columnCStudiesStr = worksheet.cells(atColumns: [columnC])
                .compactMap { $0.stringValue(sharedStrings) }
            columns.columnDStudiesStr = worksheet.cells(atColumns: [columnD])
                .compactMap { $0.stringValue(sharedStrings) }
            setDatesList(worksheet)
            createLists()
        } catch {
            print("error : \(error.localizedDescription)")
        }
    }
    
    private func setDatesList(_ worksheet: Worksheet) {
        for row in worksheet.data?.rows ?? [] {
            let date = row.cells[4].dateValue?.toString() ?? ""
            datesList.append(date)
        }
    }
}

// MARK: - Extension to create lists and dictionnaries

extension FileStudiesService {
    
    /// create lists of items
    private func createLists() {
        certificationsList = columns.columnAStudiesStr
        organizationsList = columns.columnBStudiesStr
        themesList = columns.columnCStudiesStr
        linksList = columns.columnDStudiesStr
    }
    
    private func removeTitleColums() {
        certificationsList.removeFirst()
        organizationsList.removeFirst()
        themesList.removeFirst()
        linksList.removeFirst()
        datesList.removeFirst()
    }
    
    /// create a list with struct langages and all lists of items
    private func createAllStudiesList() {
        removeTitleColums()
        for index in 0...rowsCount - 2 {
            allStudiesList.append(Studies(certification: certificationsList[index], organization: organizationsList[index], theme: themesList[index], link: linksList[index], date: datesList[index]))
        }
    }
}

// MARK: - Extension to debug lists and dictionnaries

extension FileStudiesService {
    
    /// function to debug list
    private func debugLists() {
        print("worksheet.data?.rows.count - rowsCount : \(rowsCount)")
        print("allStudiesList : \(allStudiesList)")
        print("allStudiesList count : \(allStudiesList.count)")
        print("certificationsList : \(certificationsList)")
        print("certificationsList COUNT : \(certificationsList.count)")
        print("organizationsList : \(organizationsList)")
        print("themesList : \(themesList)")
        print("linksList : \(linksList)")
        print("datesList : \(datesList)")
    }
}
