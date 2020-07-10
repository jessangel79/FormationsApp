//
//  FileFormationsService+Debug.swift
//  FormationsApp
//
//  Created by Angelique Babin on 10/07/2020.
//  Copyright © 2020 Angelique Babin. All rights reserved.
//

import Foundation
import CoreXLSX

// MARK: - Extension to debug lists and dictionnaries

extension FileFormationsService {
    
    /// function to debug list
    func debugLists() {
        print("worksheet.data?.rows.count - rowsCount : \(rowsCount)")
        print("rowsCountSwift : \(rowsCountSwift)")
        print("rowsCountSwiftUi : \(rowsCountSwiftUi)")
        print("rowsCountKotlin : \(rowsCountKotlin)")
        print("rowsCountHtmlCss : \(rowsCountHtmlCss)")
        print("rowsCountGit : \(rowsCountGit)")
        print("rowsCountCrossPlateform : \(rowsCountCrossPlateform)")
        print("rowsCountEntrepreneuriat : \(rowsCountEntrepreneuriat)")
        print("rowsCountOthers : \(rowsCountOthers)")

        print("allFileList : \(allFileList)")
        print("allFileDict : \(allFileDict)")
        print("formationsList : \(formationsList)")
        print("formationsList COUNT : \(formationsList.count)")

        print("websitesList : \(websitesList)")
        print("statesList : \(statesList)")
        print("langagesList : \(langagesList)")
        print("organizationsList : \(organizationsList)")
        print("notesList : \(notesList)")
        print("detailsList : \(detailsList)")
        print("allFileList count : \(allFileList.count)")
        print("startDatesList : \(startDatesList)")
        print("endDatesList : \(endDatesList)")
        print("startDatesList COUNT : \(startDatesList.count)")
        print("endDatesList COUNT : \(endDatesList.count)")
    }
    
    func debugCountLangage() {
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
    func debugWorksheetRowsAndColumns(_ file: XLSXFile, _ worksheet: Worksheet) throws {
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
