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
      
    var cellule: String?
    var allFileDict = [String: [Langages]]()
    private var cellSelected: Langages?
    private let segueToDetailsFormation = Constants.SegueToDetailsFormation

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: Constants.ListLangagesTableViewCell, bundle: nil)
        listFormationsTableView.register(nib, forCellReuseIdentifier: Constants.ListLangagesCell)
        listFormationsTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listFormationsTableView.reloadData()
    }
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
        return listFormationsCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
        performSegue(withIdentifier: self.segueToDetailsFormation, sender: self)
    }
}

// MARK: - Navigation

extension ListFormationsViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToDetailsFormation {
            guard let detailsFormationVC = segue.destination as? DetailsFormationViewController else { return }
            detailsFormationVC.cellule = self.cellSelected
            detailsFormationVC.allFileDict = self.allFileDict
        }
    }
}
