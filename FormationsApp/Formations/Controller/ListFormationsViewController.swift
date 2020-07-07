//
//  ListFormationsViewController.swift
//  FormationsApp
//
//  Created by Angelique Babin on 24/06/2020.
//  Copyright © 2020 Angelique Babin. All rights reserved.
//

import UIKit

final class ListFormationsViewController: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet private weak var listFormationsTableView: UITableView! {
        didSet { listFormationsTableView.tableFooterView = UIView() }
    }
    
    // MARK: - Properties
      
    private var cellSelected: Langages?
    private let segueToDetailsFormation = Constants.SegueToDetailsFormation
//    var allFileList = [Langages]() // en attendant de faire détails formations
    var allFileDict = [String: [Langages]]()
    var langagesList = [String]()
    var cellule: String?  
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: Constants.ListLangagesTableViewCell, bundle: nil)
        listFormationsTableView.register(nib, forCellReuseIdentifier: Constants.ListLangagesCell)
        print("cellSelected viewDidLoad in listFormationsVC : \(String(describing: cellSelected))")
        listFormationsTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
        var count = Int()
        switch cellule {
        case Constants.Swift:
            count = allFileDict[Constants.Swift]?.count ?? 0
        case Constants.SwiftUi:
            count = allFileDict[Constants.SwiftUi]?.count ?? 0
        case Constants.Kotlin:
            count = allFileDict[Constants.Kotlin]?.count ?? 0
        case Constants.HtmlCss:
            count = allFileDict[Constants.HtmlCss]?.count ?? 0
        case Constants.Git:
            count = allFileDict[Constants.Git]?.count ?? 0
        case Constants.Entrepreneuriat:
            count = allFileDict[Constants.Entrepreneuriat]?.count ?? 0
        case Constants.CrossPlateform:
            count = allFileDict[Constants.CrossPlateform]?.count ?? 0
        default:
            count = allFileDict[Constants.Others]?.count ?? 0
        }
        return count
//        return langagesDict.count
//        organizationsList = organizationsList.removingDuplicates()
//        return organizationsList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let listFormationsCell = tableView.dequeueReusableCell(withIdentifier: Constants.ListLangagesCell,
                                                                 for: indexPath) as? ListLangagesTableViewCell else {
            return UITableViewCell()
        }
        var formation: Langages?
        switch cellule {
        case Constants.Swift:
            formation = allFileDict[Constants.Swift]?[indexPath.row]
        case Constants.SwiftUi:
            formation = allFileDict[Constants.SwiftUi]?[indexPath.row]
        case Constants.Kotlin:
            formation = allFileDict[Constants.Kotlin]?[indexPath.row]
        case Constants.HtmlCss:
            formation = allFileDict[Constants.HtmlCss]?[indexPath.row]
        case Constants.Git:
            formation = allFileDict[Constants.Git]?[indexPath.row]
        case Constants.Entrepreneuriat:
            formation = allFileDict[Constants.Entrepreneuriat]?[indexPath.row]
        case Constants.CrossPlateform:
            formation = allFileDict[Constants.CrossPlateform]?[indexPath.row]
        default:
            formation = allFileDict[Constants.Others]?[indexPath.row]
        }
        listFormationsCell.formation = formation
        print("formation in VC TableView : \(String(describing: formation))")
        print("cellule in VC TableView : \(String(describing: cellule))")
        return listFormationsCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        var cellSelected: String?
        switch cellule {
        case Constants.Swift:
            self.cellSelected = allFileDict[Constants.Swift]?[indexPath.row]
        case Constants.SwiftUi:
            self.cellSelected = allFileDict[Constants.SwiftUi]?[indexPath.row]
        case Constants.Kotlin:
            self.cellSelected = allFileDict[Constants.Kotlin]?[indexPath.row]
        case Constants.HtmlCss:
            self.cellSelected = allFileDict[Constants.HtmlCss]?[indexPath.row]
        case Constants.Git:
            self.cellSelected = allFileDict[Constants.Git]?[indexPath.row]
        case Constants.Entrepreneuriat:
            self.cellSelected = allFileDict[Constants.Entrepreneuriat]?[indexPath.row]
        case Constants.CrossPlateform:
            self.cellSelected = allFileDict[Constants.CrossPlateform]?[indexPath.row]
        default:
            self.cellSelected = allFileDict[Constants.Others]?[indexPath.row]
        }

//        switch cellSelectedListOrgVC {
//        case Constants.Swift:
//            self.cellSelectedListOrgVC = organizationsDict[Constants.Swift]?[indexPath.row]
//        case Constants.SwiftUi:
//            self.cellSelectedListOrgVC = organizationsDict[Constants.SwiftUi]?[indexPath.row]
//        case Constants.Kotlin:
//            self.cellSelectedListOrgVC = organizationsDict[Constants.Kotlin]?[indexPath.row]
//        case Constants.HtmlCss:
//            self.cellSelectedListOrgVC = organizationsDict[Constants.HtmlCss]?[indexPath.row]
//        case Constants.Git:
//            self.cellSelectedListOrgVC = organizationsDict[Constants.Git]?[indexPath.row]
//        case Constants.Entrepreneuriat:
//            self.cellSelectedListOrgVC = organizationsDict[Constants.Entrepreneuriat]?[indexPath.row]
//        case Constants.CrossPlateform:
//            self.cellSelectedListOrgVC = organizationsDict[Constants.CrossPlateform]?[indexPath.row]
//        default:
//            self.cellSelectedListOrgVC = organizationsDict[Constants.Others]?[indexPath.row]
//        }
        
        // OK
//        self.cellSelected = langagesDict[Constants.Formations]?[indexPath.row]
           
//        self.cellSelected = allFileList[indexPath.row].formation
//        self.cellSelected = allFileDict[indexPath.row]
        print("cellSelected in ListFormationsVC : \(String(describing: cellSelected))")
        performSegue(withIdentifier: self.segueToDetailsFormation, sender: self)
    }
}

// MARK: - Navigation

extension ListFormationsViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToDetailsFormation {
            guard let detailsFormationVC = segue.destination as? DetailsFormationViewController else { return }
            detailsFormationVC.cellule = self.cellSelected
//            detailsFormationVC.allFileList = self.allFileList
            detailsFormationVC.allFileDict = self.allFileDict
        }
    }
}
