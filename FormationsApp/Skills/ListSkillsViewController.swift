//
//  ListSkillsViewController.swift
//  FormationsApp
//
//  Created by Angelique Babin on 08/07/2020.
//  Copyright © 2020 Angelique Babin. All rights reserved.
//

import UIKit
import CoreXLSX

final class ListSkillsViewController: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet private weak var listSkillsTableView: UITableView!
    
    // MARK: - Properties
    
    private let fileSkillsService = FileSkillsService()
    private var cellSelected: Skills?
    private let segueToDetailsSkill = Constants.SegueToDetailsSkill
    private var allSkillsList = [Skills]()
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: Constants.ListSkillsTableViewCell, bundle: nil)
        listSkillsTableView.register(nib, forCellReuseIdentifier: Constants.ListSkillsCell)
        
        guard let path = Bundle.main.path(forResource: "skills", ofType: "xlsx"), let file = XLSXFile(filepath: path) else { return }

        do {
            try fileSkillsService.parseFile(file)
            allSkillsList = fileSkillsService.allSkillsList

        } catch {
            title = error.localizedDescription
        }
        listSkillsTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listSkillsTableView.reloadData()
    }
}

// MARK: - UITableViewDataSource - UITableViewDelegate

extension ListSkillsViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allSkillsList.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let listSkillsCell = tableView.dequeueReusableCell(withIdentifier: Constants.ListSkillsCell,
                                                                 for: indexPath) as? ListSkillsTableViewCell else {
            return UITableViewCell()
        }
        let knowledge = allSkillsList[indexPath.row]
        listSkillsCell.knowledge = knowledge
        return listSkillsCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.cellSelected = allSkillsList[indexPath.row]
        print("cellSelected in ListLangagesVC : \(String(describing: cellSelected))")
        performSegue(withIdentifier: self.segueToDetailsSkill, sender: self)
    }
}

// MARK: - Navigation

extension ListSkillsViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToDetailsSkill {
            guard let detailsSkillVC = segue.destination as? DetailsSkillViewController else { return }
            detailsSkillVC.cellule = self.cellSelected
            detailsSkillVC.allSkillsList = self.allSkillsList
        }
    }
}
