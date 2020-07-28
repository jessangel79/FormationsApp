//
//  ListExperiencesViewController.swift
//  FormationsApp
//
//  Created by Angelique Babin on 10/07/2020.
//  Copyright © 2020 Angelique Babin. All rights reserved.
//

import UIKit
import CoreXLSX

final class ListExperiencesViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet private weak var listExperiencesTableView: UITableView! {
        didSet { listExperiencesTableView.tableFooterView = UIView() }
    }

    // MARK: - Properties

    private let fileExpriencesService = FileExperiencesService()
    private var cellSelected: Experiences?
    private let segueToDetailsExperience = Constants.SegueToDetailsExperience
    private var allExperiencesList = [Experiences]()

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: Constants.ListStudiesTableViewCell, bundle: nil)
        listExperiencesTableView.register(nib, forCellReuseIdentifier: Constants.ListStudiesCell)

        guard let path = Bundle.main.path(forResource: "experiences", ofType: "xlsx"), let file = XLSXFile(filepath: path) else { return }

        do {
            try fileExpriencesService.parseFile(file)
            allExperiencesList = fileExpriencesService.allExperiencesList

        } catch {
            title = error.localizedDescription
        }
        navigationController?.isToolbarHidden = true
        listExperiencesTableView.reloadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isToolbarHidden = true
        listExperiencesTableView.reloadData()
    }
}

// MARK: - UITableViewDataSource - UITableViewDelegate

extension ListExperiencesViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allExperiencesList.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let listExperiencesCell = tableView.dequeueReusableCell(withIdentifier: Constants.ListStudiesCell,
                                                                 for: indexPath) as? ListStudiesTableViewCell else {
            return UITableViewCell()
        }
        let experiences = allExperiencesList[indexPath.row]
        listExperiencesCell.experiences = experiences
        return listExperiencesCell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.cellSelected = allExperiencesList[indexPath.row]
        performSegue(withIdentifier: self.segueToDetailsExperience, sender: self)
    }
}

// MARK: - Navigation

extension ListExperiencesViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToDetailsExperience {
            guard let detailsExpVC = segue.destination as? DetailsExperienceViewController else { return }
            detailsExpVC.cellule = self.cellSelected
        }
    }
}
