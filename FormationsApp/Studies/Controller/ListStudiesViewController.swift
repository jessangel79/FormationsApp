//
//  ListStudiesViewController.swift
//  FormationsApp
//
//  Created by Angelique Babin on 10/07/2020.
//  Copyright © 2020 Angelique Babin. All rights reserved.
//

import UIKit
import CoreXLSX

final class ListStudiesViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet private weak var listStudiesTableView: UITableView!
    
    // MARK: - Properties
    
    private let fileStudiesService = FileStudiesService()
    private var cellSelected: Studies?
    private let segueToDetailsStudy = Constants.SegueToDetailsStudy
    private var allStudiesList = [Studies]()

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: Constants.ListStudiesTableViewCell, bundle: nil)
        listStudiesTableView.register(nib, forCellReuseIdentifier: Constants.ListStudiesCell)
        
        guard let path = Bundle.main.path(forResource: "studies", ofType: "xlsx"), let file = XLSXFile(filepath: path) else { return }

        do {
            try fileStudiesService.parseFile(file)
            allStudiesList = fileStudiesService.allStudiesList

        } catch {
            title = error.localizedDescription
        }
        navigationController?.isToolbarHidden = true
        listStudiesTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isToolbarHidden = true
        listStudiesTableView.reloadData()
    }
}

// MARK: - UITableViewDataSource - UITableViewDelegate

extension ListStudiesViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allStudiesList.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let listStudiesCell = tableView.dequeueReusableCell(withIdentifier: Constants.ListStudiesCell,
                                                                 for: indexPath) as? ListStudiesTableViewCell else {
            return UITableViewCell()
        }
        let studies = allStudiesList[indexPath.row]
        listStudiesCell.studies = studies
        return listStudiesCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.cellSelected = allStudiesList[indexPath.row]
        performSegue(withIdentifier: self.segueToDetailsStudy, sender: self)
    }
}

// MARK: - Navigation

extension ListStudiesViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToDetailsStudy {
            guard let detailsStudyVC = segue.destination as? DetailsStudyViewController else { return }
            detailsStudyVC.cellule = self.cellSelected
        }
    }
}
