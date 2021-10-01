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
    var allFileDict = [String: [Formations]]()
    private var cellSelected: Formations? // { didSet { loadFormations() } } // test à faire => ??s
    private let segueToDetailsFormation = Constants.SegueToDetailsFormation
    
    // test à faire => ???
//    var arrayFormations = [Formations]()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: Constants.ListFormationsTableViewCell, bundle: nil)
        listFormationsTableView.register(nib, forCellReuseIdentifier: Constants.ListFormationsCell)
        navigationController?.isToolbarHidden = true
//        loadFormations()
        listFormationsTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isToolbarHidden = true
//        loadFormations()
        listFormationsTableView.reloadData()
    }
    
    // test à faire => ???
//    private func loadFormations() {
//        guard let theme = cellSelected else { return }
//        let dict = NSDictionary(dictionary: allFileDict).allKeys(for: theme.theme)
        
//        let array = NSArray(array: dict)
//        arrayFormations = dict as? [Formations] ?? [Formations]()
//        let overdueItems = array.filtered(using: NSPredicate(format: "cellule MATCHES %@", theme.theme))
//        arrayFormations = overdueItems as? [Formations] ?? [Formations]()
        
//        arrayFormations = dict as? [Formations] ?? [Formations]()
        
//        listFormationsTableView.reloadData()
        
        // ???? voir projet Todoey
//        let predicate: NSPredicate? = nil
//        let request: NSFetchRequest<Formations> = Formations.fetchRequest()
//        let categoryPredicate = NSPredicate(format: "cellule MATCHES %@", theme.theme)
//        if let additionnalPredicate = predicate {
//            request.predicate =  NSCompoundPredicate(andPredicateWithSubpredicates: [categoryPredicate, additionnalPredicate])
//        } else {
//            request.predicate = categoryPredicate
//        }
//        guard let items = try? managedObjectContext.fetch(request) else { return [] }
//    }
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
//        return arrayFormations.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let listFormationsCell = tableView.dequeueReusableCell(withIdentifier: Constants.ListFormationsCell,
                                                                 for: indexPath) as? ListFormationsTableViewCell else {
            return UITableViewCell()
        }
        var formations: Formations?
        switch cellule {
        case Constants.Swift:
            formations = allFileDict[Constants.Swift]?[indexPath.row]
        case Constants.SwiftUi:
            formations = allFileDict[Constants.SwiftUi]?[indexPath.row]
        case Constants.Kotlin:
            formations = allFileDict[Constants.Kotlin]?[indexPath.row]
        case Constants.HtmlCss:
            formations = allFileDict[Constants.HtmlCss]?[indexPath.row]
        case Constants.Git:
            formations = allFileDict[Constants.Git]?[indexPath.row]
        case Constants.Entrepreneuriat:
            formations = allFileDict[Constants.Entrepreneuriat]?[indexPath.row]
        case Constants.CrossPlateform:
            formations = allFileDict[Constants.CrossPlateform]?[indexPath.row]
        default:
            formations = allFileDict[Constants.Others]?[indexPath.row]
        }
        listFormationsCell.formations = formations

//        listFormationsCell.formations = arrayFormations[indexPath.row]
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
        
//        self.cellSelected = arrayFormations[indexPath.row]
        performSegue(withIdentifier: self.segueToDetailsFormation, sender: self)
    }
}

// MARK: - Navigation

extension ListFormationsViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToDetailsFormation {
            guard let detailsFormationVC = segue.destination as? DetailsFormationViewController else { return }
            detailsFormationVC.cellule = self.cellSelected
        }
    }
}
