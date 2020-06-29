//
//  ListOrganismesViewController.swift
//  FormationsApp
//
//  Created by Angelique Babin on 24/06/2020.
//  Copyright © 2020 Angelique Babin. All rights reserved.
//

import UIKit

final class ListOrganizationsViewController: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet private weak var listOrganizationsTableView: UITableView! {
        didSet { listOrganizationsTableView.tableFooterView = UIView() }
    }

    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Properties
    
    var allList = [Langages]()
    var allDict = [String: [Langages]]()
    var langagesList = [String]()
    var langagesDict = [String: [String]]()
    var organizationsList = [String]()
    var organizationsDict = [String: [String]]()

    var cellule: String?
//    var cellule: Langages?
//    var allDict = [String: [String]]()
    
    private let fileService = FileService()
    private var cellSelected: String?
    private let segueToListFormations = Constants.SegueToListFormations
    
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
        listOrganizationsTableView.register(nib, forCellReuseIdentifier: Constants.ListLangagesCell)
        print("organizationsDict in VC : \(organizationsDict)")
        print("organizationsList in VC : \(organizationsList)")
        
//        print("cellule viewDidLoad in listOrgVC : \(cellule ?? "error cellule")")
        print("cellSelected viewDidLoad in listOrgVC : \(cellSelected ?? "error cellule")")
        
        print("allDict :")
        print(allDict)

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
            count = organizationsDict[Constants.Swift]?.count ?? 0
        case Constants.SwiftUi:
            count = organizationsDict[Constants.SwiftUi]?.count ?? 0
        case Constants.Kotlin:
            count = organizationsDict[Constants.Kotlin]?.count ?? 0
        case Constants.HtmlCss:
            count = organizationsDict[Constants.HtmlCss]?.count ?? 0
        case Constants.Git:
            count = organizationsDict[Constants.Git]?.count ?? 0
        case Constants.Entrepreneuriat:
            count = organizationsDict[Constants.Entrepreneuriat]?.count ?? 0
        case Constants.CrossPlateform:
            count = organizationsDict[Constants.CrossPlateform]?.count ?? 0
        default:
            count = organizationsDict[Constants.Others]?.count ?? 0
        }
        return count
//        return langagesDict.count
//        organizationsList = organizationsList.removingDuplicates()
//        return organizationsList.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let listOrganizationsCell = tableView.dequeueReusableCell(withIdentifier: Constants.ListLangagesCell,
                                                                 for: indexPath) as? ListLangagesTableViewCell else {
            return UITableViewCell()
        }
        var organization: String?
        switch cellule {
        case Constants.Swift:
            organization = organizationsDict[Constants.Swift]?[indexPath.row]
        case Constants.SwiftUi:
            organization = organizationsDict[Constants.SwiftUi]?[indexPath.row]
        case Constants.Kotlin:
            organization = organizationsDict[Constants.Kotlin]?[indexPath.row]
        case Constants.HtmlCss:
            organization = organizationsDict[Constants.HtmlCss]?[indexPath.row]
        case Constants.Git:
            organization = organizationsDict[Constants.Git]?[indexPath.row]
        case Constants.Entrepreneuriat:
            organization = organizationsDict[Constants.Entrepreneuriat]?[indexPath.row]
        case Constants.CrossPlateform:
            organization = organizationsDict[Constants.CrossPlateform]?[indexPath.row]
        default:
            organization = organizationsDict[Constants.Others]?[indexPath.row]
        }

//        listOrganizationsCell.organization = organization
//        organizationsList = organizationsList.removingDuplicates()
//        let organization = organizationsList[indexPath.row]
        listOrganizationsCell.organization = organization
        print("organization in VC TableView : \(String(describing: organization))")
        print("cellule in VC TableView : \(String(describing: cellule))")
        return listOrganizationsCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        switch cellSelected {
//        case Constants.Udemy:
        
//            cellSelected = udemyList[0]
//            cellSelected = organizationsList[indexPath.row]
        
//            cellSelected = organizationsDict[Constants.Udemy]?[indexPath.row]
//        case Constants.Hws:
//            cellSelected = hwsList[indexPath.row]
//        case Constants.Coursera:
//            cellSelected = courseraList[indexPath.row]
//        case Constants.SwiftOrg:
//            cellSelected = swiftOrgList[indexPath.row]
//        case Constants.PurpleGiraffe:
//            cellSelected = purpleGiraffeList[indexPath.row]
//        case Constants.Cwc:
//            cellSelected = cwcList[indexPath.row]
//        case Constants.CodinGame:
//            cellSelected = codinGameList[indexPath.row]
//        case Constants.Microsoft:
//            cellSelected = microsoftList[indexPath.row]
//        case Constants.Raywenderlich:
//            cellSelected = raywenderlichList[indexPath.row]
//        case Constants.LearnGitBranching:
//            cellSelected = learnGitBranchingList[indexPath.row]
//        case Constants.OpenClassrooms:
//            cellSelected = openClassroomsList[indexPath.row]
//        default:
//            cellSelected = diversList[indexPath.row]
//        }
//        let organizationsListRemoveDuplicate = organizationsList.removingDuplicates()
        
//        self.cellSelected = organizationsList[indexPath.row]  // ok
        self.cellSelected = organizationsList[indexPath.row]  // ok

//        self.cellSelected = organizationsDict[cellSelected ?? "errror"]?[indexPath.row] // KO

//        self.cellSelected = organizationsDict[Constants.Hws]?[indexPath.row] // KO
//        self.cellSelected = organizationsList[indexPath.row] // KO

        print("cellSelected : \(cellSelected ?? "error cellSelected")")
        print("organizationsList indexPathRow in ListOrgVC : \(organizationsList[indexPath.row])")
//        print("organizationsList in ListOrgVC : \(organizationsList)")
//        print("organizationsDict in ListOrgVC : \(organizationsDict)")
        print("cellSelected in ListOrgVC : \(String(describing: cellSelected))")
        performSegue(withIdentifier: self.segueToListFormations, sender: self)
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToListFormations {
            guard let listFormationsVC = segue.destination as? ListOrganizationsViewController else { return }
//            listFormationsVC.cellule = self.cellSelected
            listFormationsVC.organizationsDict =  organizationsDict
            listFormationsVC.organizationsList = organizationsList
            listFormationsVC.udemyList = udemyList
            listFormationsVC.hwsList = hwsList
            listFormationsVC.courseraList = courseraList
            listFormationsVC.swiftOrgList = swiftOrgList
            listFormationsVC.purpleGiraffeList = purpleGiraffeList
            listFormationsVC.cwcList = cwcList
            listFormationsVC.codinGameList = codinGameList
            listFormationsVC.microsoftList = microsoftList
            listFormationsVC.raywenderlichList = raywenderlichList
            listFormationsVC.learnGitBranchingList = learnGitBranchingList
            listFormationsVC.openClassroomsList = openClassroomsList
            listFormationsVC.diversList = diversList

        }
    }
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
