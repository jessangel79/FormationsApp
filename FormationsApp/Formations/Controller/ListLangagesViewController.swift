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
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Properties
    
    private var columns = Columns()
    private var cellSelected: String?
    private let segueToListOrganizations = Constants.SegueToListOrganizations
    
    var allLangagesList = [[String]]()
//    var allLangagesDict = [String: String]()
    var allLangagesDict = [
        "swift": [String](), "swiftUi": [String](), "kotlin": [String](), "htmlCss": [String](), "git": [String](), "entrepreneuriat": [String](), "crossPlateform": [String](), "others": [String]()
    ]
    
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
        listLangagesTableView.register(nib, forCellReuseIdentifier: Constants.ListLangagesCell)
        
        guard let path = Bundle.main.path(forResource: "formations", ofType: "xlsx"), let file = XLSXFile(filepath: path) else { return }

        do {
            try parseFile(file)
            title = columns.columnDStrings.first
            print("Title => columns.columnDStrings.first : \(String(describing: columns.columnDStrings.first))")
        } catch {
            title = error.localizedDescription
        }
        
        listLangagesTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listLangagesTableView.reloadData()
    }
    
    // MARK: - Methods
    
    private func parseFile(_ file: XLSXFile) throws {
        for wbk in try file.parseWorkbooks() {
            for (name, path) in try file.parseWorksheetPathsAndNames(workbook: wbk) {
                if let worksheetName = name {
                    print("This worksheet has a name: \(worksheetName)")
//                    print("Title => columns.columnDStrings.first : \(String(describing: columns.columnDStrings.first))")
//                    title = worksheetName
//                    titleLabel.text = worksheetName
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
            
            createListsLangages()
        } catch {
            title = error.localizedDescription
        }
    }

    private func createListsLangages() {
        for index in 1...8 {
            langagesList.append(columns.columnDStrings[index])
        }
        for index in 1...9 {
            swiftList.append(columns.columnEStrings[index])
        }
        for index in 10...11 {
            swiftUiList.append(columns.columnEStrings[index])
        }
        for index in 12...13 {
            kotlinList.append(columns.columnEStrings[index])
        }
        htmlCssList.append(columns.columnEStrings[14])
        gitList.append(columns.columnEStrings[15])
        for index in 16...17 {
            entrepreneuriatList.append(columns.columnEStrings[index])
        }
        crossPlateformList.append(columns.columnEStrings[18])
        othersList.append(columns.columnEStrings[19])
        
        allLangagesList += [
            swiftList, swiftUiList, kotlinList, htmlCssList, gitList, entrepreneuriatList, crossPlateformList, othersList
        ]
        
//        let personne = ["Nom": "Durand", "Prénom": "Maxime", "Adresse": "94 rue machin", "Ville": "Lille"]
//
//        for (cle, valeur) in personne {
//            print(cle + " - " + valeur)
//        }
        allLangagesDict["swift"] = swiftList //.joined(separator: ", ")
        allLangagesDict["swiftUi"] = swiftUiList
        allLangagesDict["kotlin"] = kotlinList
        allLangagesDict["htmlCss"] = htmlCssList
        allLangagesDict["git"] = gitList
        allLangagesDict["entrepreneuriat"] = entrepreneuriatList
        allLangagesDict["crossPlateform"] = crossPlateformList
        allLangagesDict["others"] = othersList
        
        print("allLangagesDict : \(allLangagesDict)")
        
        print("allLangagesList : \(allLangagesList)")

        print("langagesList : \(langagesList)")
        print("swiftList : \(swiftList)")
        print("swiftUiList : \(swiftUiList)")
        print("kotlinList : \(kotlinList)")
        print("htmlCssList : \(htmlCssList)")
        print("gitList : \(gitList)")
        print("entrepreneuriatList : \(entrepreneuriatList)")
        print("crossPlateformList : \(crossPlateformList)")
        print("othersList : \(othersList)")
        
        // test
        organizationsList.append(contentsOf: columns.columnEStrings)
        print("organizationsList : \(organizationsList)")
    }
        
//    private func setDatasFile(_ columns: Columns) {
//        title = columns.columnDStrings[1]
//        langageLabel.text = columns.columnDStrings[1]
//        for row in columns.columnDStrings {
//            listLangages.append(row)
//        }
        
//        langageImageView.image = UIImage(named: "")
//        listSkillsTextView.text = columns.columnAStrings[1]
//        skillsTextView.text = columns.columnBStrings[1]
//        degreeLabel.text = columns.columnCStrings[1]
//        evidenceSkillsTextView.text = columns.columnDStrings[1]
//    }

}

// MARK: - UITableViewDataSource - UITableViewDelegate

extension ListLangagesViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return langagesList.count
//        return columns.columnDStrings.count
//        return columns.columnAStrings.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let listLangagesCell = tableView.dequeueReusableCell(withIdentifier: Constants.ListLangagesCell,
                                                                 for: indexPath) as? ListLangagesTableViewCell else {
            return UITableViewCell()
        }
        let langage = langagesList[indexPath.row]
        listLangagesCell.langage = langage
        return listLangagesCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.cellSelected = langagesList[indexPath.row]
//        self.cellSelected = swiftList[indexPath.row]

        self.cellSelected = langagesList[indexPath.row]

//        self.cellSelected = placesList[indexPath.row]
//        self.imageOfCellSelected = placesTypeList[indexPath.row]
//        celluleIndex = indexPath.row
//        self.photoOfCellSelected = photosList[indexPath.row]
//        self.placeIdCellSelected = placeIDsList[indexPath.row]
        performSegue(withIdentifier: self.segueToListOrganizations, sender: self)
    }
}

// MARK: - Navigation

extension ListLangagesViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToListOrganizations {
            guard let listOrganizationsVC = segue.destination as? ListOrganizationsViewController else { return }
            listOrganizationsVC.cellule = self.cellSelected
            listOrganizationsVC.langagesList = self.langagesList
            listOrganizationsVC.swiftList = self.swiftList
            listOrganizationsVC.swiftUiList = self.swiftUiList
            listOrganizationsVC.kotlinList = self.kotlinList
            listOrganizationsVC.htmlCssList = self.htmlCssList
            listOrganizationsVC.crossPlateformList = self.crossPlateformList
            listOrganizationsVC.othersList = self.othersList
            listOrganizationsVC.entrepreneuriatList = self.entrepreneuriatList
            listOrganizationsVC.gitList = self.gitList
            listOrganizationsVC.organizationsList = self.organizationsList
            listOrganizationsVC.allLangagesList = self.allLangagesList
            listOrganizationsVC.allLangagesDict = self.allLangagesDict
            
//            detailsPlaceVC.imageOfCellule = self.imageOfCellSelected
//            detailsPlaceVC.celluleIndex = celluleIndex
//            detailsPlaceVC.photoOfCellule = self.photoOfCellSelected
//            detailsPlaceVC.placeIdCellule = self.placeIdCellSelected
//            detailsPlaceVC.placeDetailsResultsList = self.placeDetailsResultsList
        }
    }
}
