//
//  ViewController.swift
//  FormationsApp
//
//  Created by Angelique Babin on 23/06/2020.
//  Copyright © 2020 Angelique Babin. All rights reserved.
//

import UIKit
import CoreXLSX

final class ListLangagesViewController: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet private weak var listLangagesTableView: UITableView!
    
    // MARK: - Properties
    
    private let fileService = FileService()
    private var cellSelected: String?
    private let segueToListFormations = Constants.SegueToListFormations
    private var langagesList = [String]()
    private var allFileDict = [String: [Langages]]()

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: Constants.ListLangagesTableViewCell, bundle: nil)
        listLangagesTableView.register(nib, forCellReuseIdentifier: Constants.ListLangagesCell)
        
        guard let path = Bundle.main.path(forResource: "formations", ofType: "xlsx"), let file = XLSXFile(filepath: path) else { return }

        do {
            try fileService.parseFile(file)
//            allFileList = fileService.allFileList
            langagesList = fileService.langagesList
            allFileDict = fileService.allFileDict

        } catch {
            title = error.localizedDescription
        }
        listLangagesTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listLangagesTableView.reloadData()
    }
    
    // MARK: - Methods
    
}

// MARK: - UITableViewDataSource - UITableViewDelegate

extension ListLangagesViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        langagesList = langagesList.removingDuplicates()
        return langagesList.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let listLangagesCell = tableView.dequeueReusableCell(withIdentifier: Constants.ListLangagesCell,
                                                                 for: indexPath) as? ListLangagesTableViewCell else {
            return UITableViewCell()
        }
        langagesList = langagesList.removingDuplicates()
        let langage = langagesList[indexPath.row]
        listLangagesCell.langage = langage
        return listLangagesCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        langagesList = langagesList.removingDuplicates()
        self.cellSelected = langagesList[indexPath.row]
        print("cellSelected in ListLangagesVC : \(String(describing: cellSelected))")
        performSegue(withIdentifier: self.segueToListFormations, sender: self)
    }
}

// MARK: - Navigation

extension ListLangagesViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToListFormations {
            guard let listFormationsVC = segue.destination as? ListFormationsViewController else { return }
            listFormationsVC.cellule = self.cellSelected
//            listFormationsVC.allFileList = self.allFileList
            listFormationsVC.langagesList = self.langagesList
            listFormationsVC.allFileDict = self.allFileDict
        }
    }
}
