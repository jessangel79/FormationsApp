//
//  ViewController.swift
//  FormationsApp
//
//  Created by Angelique Babin on 23/06/2020.
//  Copyright © 2020 Angelique Babin. All rights reserved.
//

import UIKit
import CoreXLSX

final class ListLangagesViewController: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet private weak var listLangagesTableView: UITableView!
//    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Properties
    
//    var langagesList = [String]()
    private var columns = Columns()

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: Constants.ListLangagesTableViewCell, bundle: nil)
        listLangagesTableView.register(nib, forCellReuseIdentifier: Constants.ListLangagesCell)
        
        guard let path = Bundle.main.path(forResource: "formations", ofType: "xlsx"), let file = XLSXFile(filepath: path) else { return }

        do {
            try parseFile(file)
        } catch {
            title = error.localizedDescription
        }
        
        listLangagesTableView.reloadData()
    }
    
    // MARK: - Methods
    
    private func parseFile(_ file: XLSXFile) throws {
        for wbk in try file.parseWorkbooks() {
            for (name, path) in try file.parseWorksheetPathsAndNames(workbook: wbk) {
                if let worksheetName = name {
                    print("This worksheet has a name: \(worksheetName)")
                    title = worksheetName
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
                        setDatasFile(Columns(columnAStrings: columns.columnAStrings,
                                             columnBStrings: columns.columnBStrings,
                                             columnCStrings: columns.columnCStrings,
                                             columnDStrings: columns.columnDStrings,
                                             columnEStrings: columns.columnEStrings,
                                             columnFStrings: columns.columnFStrings,
                                             columnGStrings: columns.columnGStrings,
                                             columnHStrings: columns.columnHStrings,
                                             columnIStrings: columns.columnIStrings,
                                             columnJStrings: columns.columnJStrings))
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
            title = error.localizedDescription
        }
    }
        
    private func setDatasFile(_ columns: Columns) {
//        title = columns.columnDStrings[1]
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

}

// MARK: - UITableViewDataSource - UITableViewDelegate

extension ListLangagesViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return listLangages.count
        return columns.columnDStrings.count
//        return columns.columnAStrings.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let listLangagesCell = tableView.dequeueReusableCell(withIdentifier: Constants.ListLangagesCell,
                                                                 for: indexPath) as? ListLangagesTableViewCell else {
            return UITableViewCell()
        }
//        let langage = listLangages[indexPath.row]
        let langage = columns.columnDStrings[indexPath.row]
//        let langage = columns.columnAStrings[indexPath.row]
        listLangagesCell.langage = langage
        return listLangagesCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.cellSelected = placesList[indexPath.row]
//        self.imageOfCellSelected = placesTypeList[indexPath.row]
//        celluleIndex = indexPath.row
//        self.photoOfCellSelected = photosList[indexPath.row]
//        self.placeIdCellSelected = placeIDsList[indexPath.row]
//        performSegue(withIdentifier: self.segueToPlaceDetails, sender: self)
    }
}

// MARK: - Navigation

//extension ListLangagesViewController {
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == segueToPlaceDetails {
//            guard let detailsPlaceVC = segue.destination as? DetailsPlaceViewController else { return }
//            detailsPlaceVC.cellule = self.cellSelected
//            detailsPlaceVC.imageOfCellule = self.imageOfCellSelected
//            detailsPlaceVC.celluleIndex = celluleIndex
//            detailsPlaceVC.photoOfCellule = self.photoOfCellSelected
//            detailsPlaceVC.placeIdCellule = self.placeIdCellSelected
//            detailsPlaceVC.placeDetailsResultsList = self.placeDetailsResultsList
//        }
//    }
//}
