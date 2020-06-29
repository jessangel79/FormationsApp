//
//  ListFormationsViewController.swift
//  FormationsApp
//
//  Created by Angelique Babin on 26/06/2020.
//  Copyright © 2020 Angelique Babin. All rights reserved.
//

import UIKit

final class ListFormationsViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var listFormationsTableView: UITableView! {
        didSet { listFormationsTableView.tableFooterView = UIView() }
    }

    // MARK: - Actions

    // MARK: - Properties
    
    var cellule: String?
    var organizationsDict = [String: [String]]()
    var organizationsList = [String]()
    var fileService = FileService()
    private var cellSelected: String?
    
    var udemyList = [String]()
    var hwsList = [String]()
    var courseraList = [String]()
    var swiftOrgList = [String]()
    var purpleGiraffeList = [String]()
    var cwcList = [String]()
    var codinGameList = [String]()
    var microsoftList = [String]()
    var raywenderlichList = [String]()
    var learnGitBranchingList = [String]()
    var openClassroomsList = [String]()
    var diversList = [String]()
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: Constants.ListLangagesTableViewCell, bundle: nil)
        listFormationsTableView.register(nib, forCellReuseIdentifier: Constants.ListLangagesCell)
//        cellule = String()

        print("cellule viewDidLoad in listFormationsVC : \(cellule ?? "error cellule")")
        print("cellSelected viewDidLoad in listFormationsVC : \(cellSelected ?? "error cellule")")
        
        listFormationsTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        cellule = String()
        listFormationsTableView.reloadData()
    }
    
    // MARK: - Methods

}

// MARK: - UITableViewDataSource - UITableViewDelegate

extension ListFormationsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return organizationsDict[Constants.Swift]?.count ?? 0
        
        var count = Int()
        switch cellule {
        case Constants.Udemy:
            count = organizationsDict[Constants.Udemy]?.count ?? 0
        case Constants.Hws:
            count = organizationsDict[Constants.Hws]?.count ?? 0
        case Constants.Coursera:
            count = organizationsDict[Constants.Coursera]?.count ?? 0
        case Constants.SwiftOrg:
            count = organizationsDict[Constants.SwiftOrg]?.count ?? 0
        case Constants.PurpleGiraffe:
            count = organizationsDict[Constants.PurpleGiraffe]?.count ?? 0
        case Constants.Cwc:
            count = organizationsDict[Constants.Cwc]?.count ?? 0
        case Constants.CodinGame:
            count = organizationsDict[Constants.CodinGame]?.count ?? 0
        case Constants.Microsoft:
            count = organizationsDict[Constants.Microsoft]?.count ?? 0
        case Constants.Raywenderlich:
            count = organizationsDict[Constants.Raywenderlich]?.count ?? 0
        case Constants.LearnGitBranching:
            count = organizationsDict[Constants.LearnGitBranching]?.count ?? 0
        case Constants.OpenClassrooms:
            count = organizationsDict[Constants.OpenClassrooms]?.count ?? 0
        default:
            count = organizationsDict[Constants.Divers]?.count ?? 0
        }
        return count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let listFormationsCell = tableView.dequeueReusableCell(withIdentifier: Constants.ListLangagesCell,
                                                                 for: indexPath) as? ListLangagesTableViewCell else {
            return UITableViewCell()
        }
        
        var formation: String?
        switch cellule {
        case Constants.Udemy:
            formation = organizationsDict[Constants.Udemy]?[indexPath.row]
//            formation = organizationsDict[Constants.Udemy]?[0]
        case Constants.Hws:
            formation = organizationsDict[Constants.Hws]?[indexPath.row]
        case Constants.Coursera:
            formation = organizationsDict[Constants.Coursera]?[indexPath.row]
        case Constants.SwiftOrg:
            formation = organizationsDict[Constants.SwiftOrg]?[indexPath.row]
        case Constants.PurpleGiraffe:
            formation = organizationsDict[Constants.PurpleGiraffe]?[indexPath.row]
        case Constants.Cwc:
            formation = organizationsDict[Constants.Cwc]?[indexPath.row]
        case Constants.CodinGame:
            formation = organizationsDict[Constants.CodinGame]?[indexPath.row]
        case Constants.Microsoft:
            formation = organizationsDict[Constants.Microsoft]?[indexPath.row]
        case Constants.Raywenderlich:
            formation = organizationsDict[Constants.Raywenderlich]?[indexPath.row]
        case Constants.LearnGitBranching:
            formation = organizationsDict[Constants.LearnGitBranching]?[indexPath.row]
        case Constants.OpenClassrooms:
            formation = organizationsDict[Constants.OpenClassrooms]?[indexPath.row]
        default:
            formation = organizationsDict[Constants.Divers]?[indexPath.row]
        }
        print("formation in VC TableView : \(formation ?? "error formation")")
        print("cellule in VC TableView : \(cellule ?? "error cellule")")
        listFormationsCell.formation = formation
        return listFormationsCell
        
//        let formation = organizationsList[indexPath.row]
//        let formation = organizationsDict[Constants.Swift]?[indexPath.row]
//        print("formation in VC TableView : \(formation ?? "error formation")")
//        print("cellule in VC TableView : \(cellule ?? "error cellule")")
//        listFormationsCell.formation = formation
//        return listFormationsCell

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

extension ListFormationsViewController {
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
