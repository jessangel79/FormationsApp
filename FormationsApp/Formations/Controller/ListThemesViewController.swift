//
//  ViewController.swift
//  FormationsApp
//
//  Created by Angelique Babin on 23/06/2020.
//  Copyright © 2020 Angelique Babin. All rights reserved.
//

import UIKit
import CoreXLSX

final class ListThemesViewController: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet private weak var listThemesTableView: UITableView!
    
    // MARK: - Properties
    
    private let fileFormationsService = FileFormationsService()
    private var themesList = [String]()
    private var allFileDict = [String: [Themes]]()
    private var cellSelected: String?
    private let segueToListFormations = Constants.SegueToListFormations

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: Constants.ListFormationsTableViewCell, bundle: nil)
        listThemesTableView.register(nib, forCellReuseIdentifier: Constants.ListFormationsCell)
        
        guard let path = Bundle.main.path(forResource: "formations", ofType: "xlsx"), let file = XLSXFile(filepath: path) else { return }

        do {
            try fileFormationsService.parseFile(file)
            themesList = fileFormationsService.themesList
            allFileDict = fileFormationsService.allFileDict

        } catch {
            title = error.localizedDescription
        }
        listThemesTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listThemesTableView.reloadData()
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        navigationController?.navigationBar.barStyle = .default
//    }
}

// MARK: - UITableViewDataSource - UITableViewDelegate

extension ListThemesViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        themesList = themesList.removingDuplicates()
        return themesList.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let listThemesCell = tableView.dequeueReusableCell(withIdentifier: Constants.ListFormationsCell,
                                                                 for: indexPath) as? ListFormationsTableViewCell else {
            return UITableViewCell()
        }
        themesList = themesList.removingDuplicates()
        let theme = themesList[indexPath.row]
        listThemesCell.theme = theme
        return listThemesCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        themesList = themesList.removingDuplicates()
        self.cellSelected = themesList[indexPath.row]
        performSegue(withIdentifier: self.segueToListFormations, sender: self)
    }
}

// MARK: - Navigation

extension ListThemesViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToListFormations {
            guard let listFormationsVC = segue.destination as? ListFormationsViewController else { return }
            listFormationsVC.cellule = self.cellSelected
            listFormationsVC.allFileDict = self.allFileDict
        }
    }
}
