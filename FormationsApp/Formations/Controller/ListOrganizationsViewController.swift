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

    @IBOutlet private weak var listOrganizationsTableView: UITableView! {
        didSet { listOrganizationsTableView.tableFooterView = UIView() }
    }

    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Properties

    var cellule: String?
    private var columns = Columns()
    
//    var allLangagesList = [[String]]()
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
//    var titlesList = [String]()
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: Constants.ListLangagesTableViewCell, bundle: nil)
        listOrganizationsTableView.register(nib, forCellReuseIdentifier: Constants.ListLangagesCell)
//        title = titlesList[4]
        listOrganizationsTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listOrganizationsTableView.reloadData()
    }
    
    // MARK: - Methods
        
}

// MARK: - UITableViewDataSource - UITableViewDelegate

extension ListOrganizationsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = Int()
        switch cellule {
        case Constants.Swift:
            count = allLangagesDict[Constants.Swift]?.count ?? 0
        case Constants.SwiftUi:
            count = allLangagesDict[Constants.SwiftUi]?.count ?? 0
        case Constants.Kotlin:
            count = allLangagesDict[Constants.Kotlin]?.count ?? 0
        case Constants.HtmlCss:
            count = allLangagesDict[Constants.HtmlCss]?.count ?? 0
        case Constants.Git:
            count = allLangagesDict[Constants.Git]?.count ?? 0
        case Constants.Entrepreneuriat:
            count = allLangagesDict[Constants.Entrepreneuriat]?.count ?? 0
        case Constants.CrossPlateform:
            count = allLangagesDict[Constants.CrossPlateform]?.count ?? 0
        default:
            count = allLangagesDict[Constants.Others]?.count ?? 0
        }
        return count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let listOrganizationsCell = tableView.dequeueReusableCell(withIdentifier: Constants.ListLangagesCell,
                                                                 for: indexPath) as? ListLangagesTableViewCell else {
            return UITableViewCell()
        }
        var organization: String?
        switch cellule {
        case Constants.Swift:
            organization = allLangagesDict[Constants.Swift]?[indexPath.row]
        case Constants.SwiftUi:
            organization = allLangagesDict[Constants.SwiftUi]?[indexPath.row]
        case Constants.Kotlin:
            organization = allLangagesDict[Constants.Kotlin]?[indexPath.row]
        case Constants.HtmlCss:
            organization = allLangagesDict[Constants.HtmlCss]?[indexPath.row]
        case Constants.Git:
            organization = allLangagesDict[Constants.Git]?[indexPath.row]
        case Constants.Entrepreneuriat:
            organization = allLangagesDict[Constants.Entrepreneuriat]?[indexPath.row]
        case Constants.CrossPlateform:
            organization = allLangagesDict[Constants.CrossPlateform]?[indexPath.row]
        default:
            organization = allLangagesDict[Constants.Others]?[indexPath.row]
        }
        print("organization in VC : \(organization ?? "error")")
        print("cellule : \(cellule ?? "error cellule")")
        listOrganizationsCell.organization = organization
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
