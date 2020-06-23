//
//  ListTableViewCell.swift
//  FormationsApp
//
//  Created by Angelique Babin on 23/06/2020.
//  Copyright © 2020 Angelique Babin. All rights reserved.
//

import UIKit
import CoreXLSX

final class ListLangagesTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var langageImageView: UIImageView!
    @IBOutlet weak var langageLabel: UILabel! // column D
    
    // MARK: - Properties
    
    private var columns = Columns()
        
    var langage: String? {
        didSet {
            langageLabel.text = langage
//            langageLabel.text = columns.columnDStrings.first
//            print(columns.columnDStrings.first ?? "error")
            print(langage ?? "error langage")

//            langageImageView.image = UIImage(named: "")
        }
    }
        
    // MARK: - View Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        guard let path = Bundle.main.path(forResource: "fichier", ofType: "xlsx"), let file = XLSXFile(filepath: path) else { return }
//
//        do {
//            try parseFile(file)
//        } catch {
//            langageLabel.text = error.localizedDescription
//        }
    }
    
    // MARK: - Methods

    private func parseFile(_ file: XLSXFile) throws {
        for wbk in try file.parseWorkbooks() {
            for (name, path) in try file.parseWorksheetPathsAndNames(workbook: wbk) {
                if let worksheetName = name {
                    print("This worksheet has a name: \(worksheetName)")
                    largeContentTitle = worksheetName
//                    titleLabel.text = worksheetName
                }
                let worksheet = try file.parseWorksheet(at: path)
                for row in worksheet.data?.rows ?? [] {
                    for cell in row.cells {
                        print(cell)
                        setColumnsFile(file: file, worksheet: worksheet)

//                        setLabels(Columns(columnAStrings: columns.columnAStrings,
//                                          columnBStrings: columns.columnBStrings,
//                                          columnCStrings: columns.columnCStrings,
//                                          columnDStrings: columns.columnDStrings))
//                        setDatasFile(Columns(columnAStrings: columns.columnAStrings,
//                                             columnBStrings: columns.columnBStrings,
//                                             columnCStrings: columns.columnCStrings,
//                                             columnDStrings: columns.columnDStrings,
//                                             columnEStrings: columns.columnEStrings,
//                                             columnFStrings: columns.columnFStrings,
//                                             columnGStrings: columns.columnGStrings,
//                                             columnHStrings: columns.columnHStrings,
//                                             columnIStrings: columns.columnIStrings,
//                                             columnJStrings: columns.columnJStrings))
                    }
                }
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
            guard let columnH = Constants.columnH else { return }
            guard let columnI = Constants.columnI else { return }
            guard let columnJ = Constants.columnJ else { return }

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
            columns.columnHStrings = worksheet.cells(atColumns: [columnH])
                .compactMap { $0.stringValue(sharedStrings) }
            columns.columnIStrings = worksheet.cells(atColumns: [columnI])
                .compactMap { $0.stringValue(sharedStrings) }
            columns.columnJStrings = worksheet.cells(atColumns: [columnJ])
                .compactMap { $0.stringValue(sharedStrings) }
        } catch {
            langageLabel.text = error.localizedDescription
        }
    }
    
    private func setDatasFile(_ columns: Columns) {
//        langageLabel.text = columns.columnDStrings[1]
        for row in columns.columnDStrings {
            listLangages.append(row)
        }
        
//        langageImageView.image = UIImage(named: "")
//        listSkillsTextView.text = columns.columnAStrings[1]
//        skillsTextView.text = columns.columnBStrings[1]
//        degreeLabel.text = columns.columnCStrings[1]
//        evidenceSkillsTextView.text = columns.columnDStrings[1]
    }
    
    private func setLabels(_ columns: Columns) {
//        langageImageView.image = UIImage(named: "")
//        langageLabel.text = columns.columnDStrings.first
        
//        listSkillsLabel.text = columns.columnAStrings.first
//        skillsLabel.text = columns.columnBStrings.first
//        degreeTitleLabel.text = columns.columnCStrings.first
//        evidenceSkillsLabel.text = columns.columnDStrings.first
    }

}
