//
//  ListOrganismesViewController.swift
//  FormationsApp
//
//  Created by Angelique Babin on 24/06/2020.
//  Copyright © 2020 Angelique Babin. All rights reserved.
//

import UIKit
import CoreXLSX

final class ListOrganizationsViewController: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet private weak var listOrganizationsTableView: UITableView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Properties

    var cellule: String?
    private var columns = Columns()
    
    var allLangagesList = [[String]]()
    var allLangagesDict = [String: [String]]()
    
    var langagesList = [String]()
    var swiftList = [String]()
    var swiftUiList = [String]()
    var kotlinList = [String]()
    var htmlCssList = [String]()
    var crossPlateformList = [String]()
    var othersList = [String]()
    var entrepreneuriatList = [String]()
    var gitList = [String]()
    
    // test
    var organizationsList = [String]()

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: Constants.ListLangagesTableViewCell, bundle: nil)
        listOrganizationsTableView.register(nib, forCellReuseIdentifier: Constants.ListLangagesCell)
        
//        guard let path = Bundle.main.path(forResource: "formations", ofType: "xlsx"), let file = XLSXFile(filepath: path) else { return }

//        do {
//            try parseFile(file)
//            title = columns.columnEStrings.first
//            print("Title => columns.columnEStrings.first : \(String(describing: columns.columnEStrings.first))")
//        } catch {
//            title = error.localizedDescription
//        }
        
        listOrganizationsTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listOrganizationsTableView.reloadData()
    }
    
    // MARK: - Methods
    
    private func parseFile(_ file: XLSXFile) throws {
        for wbk in try file.parseWorkbooks() {
            for (name, path) in try file.parseWorksheetPathsAndNames(workbook: wbk) {
                if let worksheetName = name {
                    print("This worksheet has a name: \(worksheetName)")
                }
                let worksheet = try file.parseWorksheet(at: path)
                setColumnsFile(file: file, worksheet: worksheet)

                for row in worksheet.data?.rows ?? [] {
                    for _ in row.cells { // let cell
//                        print(cell)
//                        print(cell.reference)

//                        setColumnsFile(file: file, worksheet: worksheet)
                        
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
//            print("sharedStrings : \(sharedStrings)")
//            for item in sharedStrings.items {
//                print("items in sharedStrings \(item)")
//            }
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
}

// MARK: - UITableViewDataSource - UITableViewDelegate

extension ListOrganizationsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let langage = cellule
        var count = Int()
        switch langage {
        case "Swift":
            count = allLangagesDict["swift"]?.count ?? 0
        case "Swift UI":
            count = allLangagesDict["swiftUi"]?.count ?? 0
        case "Kotlin":
            count = allLangagesDict["kotlin"]?.count ?? 0
        case "HTML - CSS":
            count = allLangagesDict["htmlCss"]?.count ?? 0
        case "Git":
            count = allLangagesDict["git"]?.count ?? 0
        case "Entrepreneuriat":
            count = allLangagesDict["entrepreneuriat"]?.count ?? 0
        case "Cross-Plateform":
            count = allLangagesDict["crossPlateform"]?.count ?? 0
        case "Others":
            count = allLangagesDict["others"]?.count ?? 0
        default:
            print("error on row section")
        }
//        return allLangagesDict.count
//        return allLangagesDict["swift"]?.count ?? 0
//        return allLangagesDict["swiftUi"]?.count ?? 0
//        return allLangagesDict["kotlin"]?.count ?? 0

//        return organizationsList.count
//        return columns.columnEStrings.count
//        return swiftList.count
        return count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let listOrganizationsCell = tableView.dequeueReusableCell(withIdentifier: Constants.ListLangagesCell,
                                                                 for: indexPath) as? ListLangagesTableViewCell else {
            return UITableViewCell()
        }
//        var organization = String()
//        let indexPathRow = indexPath.row
//        switch indexPathRow {
//        case 0:
//            organization = swiftList[indexPathRow]
//        case 1:
//            organization = swiftUiList[indexPathRow]
//        case 2:
//            organization = kotlinList[indexPathRow]
//        case 3:
//            organization = htmlCssList[indexPathRow]
//        case 4:
//            organization = gitList[indexPathRow]
//        case 5:
//            organization = entrepreneuriatList[indexPathRow]
//        case 6:
//            organization = crossPlateformList[indexPathRow]
//        default:
//            organization = othersList[indexPathRow]
//        }
        
//        var organization = [String]()
        
//        var swift = ""
//        var swiftUi = ""
//        var kotlin = ""
//        var htmlCss = ""
//        var git = ""
//        var entrepreneuriat = ""
//        var crossPlateform = ""
//        var others = ""
//
//        let indexPathRow = indexPath.row
//        switch indexPathRow {
//        case 0:
//            for org in allLangagesList {
//                organization = org[indexPathRow]
//            }
//            organization = allLangagesList[indexPathRow]
//            swift = swiftList[indexPathRow]
//            listOrganizationsCell.swift = swift
//        case 1:
//            organization = allLangagesList[indexPathRow]
//            swiftUi = swiftUiList[indexPathRow]
//            listOrganizationsCell.swiftUi = swiftUi
//
//        case 2:
//            organization = allLangagesList[indexPathRow]
//            kotlin = kotlinList[indexPathRow]
//            listOrganizationsCell.kotlin = kotlin
//
//        case 3:
//            organization = allLangagesList[indexPathRow]
//            htmlCss = htmlCssList[indexPathRow]
//            listOrganizationsCell.htmlCss = htmlCss
//
//        case 4:
//            organization = allLangagesList[indexPathRow]
//            git = gitList[indexPathRow]
//            listOrganizationsCell.git = git
//
//        case 5:
//            organization = allLangagesList[indexPathRow]
//            entrepreneuriat = entrepreneuriatList[indexPathRow]
//            listOrganizationsCell.entrepreneuriat = entrepreneuriat
//
//        case 6:
//            organization = allLangagesList[indexPathRow]
//            crossPlateform = crossPlateformList[indexPathRow]
//            listOrganizationsCell.crossPlateform = crossPlateform
//        case 7:
//            organization = allLangagesList[indexPathRow]
//            others = othersList[indexPathRow]
//            listOrganizationsCell.others = others
//
//        default:
//            print("error")
//
//        }
//
        var organization: String?
        let indexPathRow = indexPath.row
        let langage = cellule
        switch langage {
        case "Swift":
//            organization = allLangagesDict["swift"]?.joined(separator: ", ")
            organization = allLangagesDict["swift"]?[indexPathRow] // swiftList[indexPathRow]
        case "Swift UI":
//            organization = allLangagesDict["swiftUi"]?.joined(separator: ", ")
            organization = allLangagesDict["swiftUi"]?[indexPathRow]
//            organization = swiftUiList[indexPathRow]
        case "Kotlin":
//            organization = allLangagesDict["kotlin"]?.joined(separator: ", ")
            organization = allLangagesDict["kotlin"]?[indexPathRow] // swiftList[indexPathRow]
//            organization = kotlinList[indexPathRow]
        case "HTML - CSS":
//            organization = allLangagesDict["htmlCss"]?.joined(separator: ", ")
            organization = allLangagesDict["htmlCss"]?[indexPathRow]
//            organization = htmlCssList[indexPathRow]
        case "Git":
//            organization = allLangagesDict["git"]?.joined(separator: ", ")
            organization = allLangagesDict["git"]?[indexPathRow]
//            organization = gitList[indexPathRow]
        case "Entrepreneuriat":
//            organization = allLangagesDict["entrepreneuriat"]?.joined(separator: ", ")
            organization = allLangagesDict["entrepreneuriat"]?[indexPathRow]

//            organization = entrepreneuriatList[indexPathRow]
        case "Cross-Plateform":
//            organization = allLangagesDict["crossPlateform"]?.joined(separator: ", ")
            organization = allLangagesDict["crossPlateform"]?[indexPathRow]
//            organization = crossPlateformList[indexPathRow]
        case "Others":
//            organization = allLangagesDict["others"]?.joined(separator: ", ")
            organization = allLangagesDict["others"]?[indexPathRow]
//            organization = othersList[indexPathRow]
        default:
            print("error switch")
        }
        // OK
//        let organization = columns.columnEStrings[indexPath.row]
//        let organization = organizationsList[indexPath.row]
//        let organization = swiftList[indexPath.row]
//        let organization = allLangagesList[indexPath.row][indexPath.row]
//        let organization = allLangagesDict["swift"]?.joined(separator: ", ")
        print("organization in VC : \(organization ?? "error")")
        print("cellule : \(cellule ?? "error cellule")")
        listOrganizationsCell.organization = organization
//        listOrganizationsCell.organization = organization[0]
//        listOrganizationsCell.organization = [swift, swiftUi, kotlin, htmlCss, git, entrepreneuriat, crossPlateform, others]
        return listOrganizationsCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.cellSelected = columns.columnEStrings[indexPath.row]
//        self.cellSelected = placesList[indexPath.row]
//        self.imageOfCellSelected = placesTypeList[indexPath.row]
//        celluleIndex = indexPath.row
//        self.photoOfCellSelected = photosList[indexPath.row]
//        self.placeIdCellSelected = placeIDsList[indexPath.row]
//        performSegue(withIdentifier: self.segueToListOrganizations, sender: self)
    }
}

// MARK: - Navigation

extension ListOrganizationsViewController {
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == segueToListOrganizations {
//            guard let listOrganizationsVC = segue.destination as? ListOrganizationsViewController else { return }
//            listOrganizationsVC.cellule = self.cellSelected
//            detailsPlaceVC.imageOfCellule = self.imageOfCellSelected
//            detailsPlaceVC.celluleIndex = celluleIndex
//            detailsPlaceVC.photoOfCellule = self.photoOfCellSelected
//            detailsPlaceVC.placeIdCellule = self.placeIdCellSelected
//            detailsPlaceVC.placeDetailsResultsList = self.placeDetailsResultsList
//        }
//    }
}
