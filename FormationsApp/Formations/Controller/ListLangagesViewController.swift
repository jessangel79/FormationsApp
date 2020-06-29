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
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Properties
    
    private let fileService = FileService()
    private var cellSelected: String?
//    private var cellSelected: Langages?
    private let segueToListOrganizations = Constants.SegueToListOrganizations
    
    private var allList = [Langages]()
    private var allDict = [String: [Langages]]()
    private var langagesList = [String]()
    private var langagesDict = [String: [String]]()
    private var organizationsList = [String]()
    private var organizationsDict = [String: [String]]()

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: Constants.ListLangagesTableViewCell, bundle: nil)
        listLangagesTableView.register(nib, forCellReuseIdentifier: Constants.ListLangagesCell)
        
        guard let path = Bundle.main.path(forResource: "formations", ofType: "xlsx"), let file = XLSXFile(filepath: path) else { return }

        do {
            try fileService.parseFile(file)
            allDict = fileService.allDict
            allList = fileService.allList
            langagesList = fileService.langagesList
            langagesDict = fileService.langagesDict
            organizationsList = fileService.organizationsList
            organizationsDict = fileService.organizationsDict
            
            print("allList :")
            print(allList)
            print("allDict :")
            print(allDict)
            print("langagesList :")
            print(langagesList)
            print("langagesDict :")
            print(langagesDict)
            print("organizationsList :")
            print(organizationsList)
            print("organizationsDict :")
            print(organizationsDict)
            
//            fileService.createListsLangages()
//            fileService.setLangagesDict()
//            fileService.createListsOrganizations()
//            fileService.setOrganizationsDict()
        } catch {
            title = error.localizedDescription
        }
//        fileService.debugCreateList()
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
        performSegue(withIdentifier: self.segueToListOrganizations, sender: self)
    }
}

// MARK: - Navigation

extension ListLangagesViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToListOrganizations {
            guard let listOrganizationsVC = segue.destination as? ListOrganizationsViewController else { return }
            listOrganizationsVC.cellule = self.cellSelected
            listOrganizationsVC.allList = self.allList
            listOrganizationsVC.allDict = self.allDict
            listOrganizationsVC.langagesList = self.langagesList
            listOrganizationsVC.langagesDict = self.langagesDict
            listOrganizationsVC.organizationsList = self.organizationsList
            listOrganizationsVC.organizationsDict = self.organizationsDict
            
//            listOrganizationsVC.allDict = fileService.langagesDict
//            listOrganizationsVC.organizationsDict = fileService.organizationsDict
//            listOrganizationsVC.organizationsList = fileService.organizationsList.removingDuplicates()
//            listOrganizationsVC.udemyList = fileService.udemyList
//            listOrganizationsVC.hwsList = fileService.hwsList
//            listOrganizationsVC.courseraList = fileService.courseraList
//            listOrganizationsVC.swiftOrgList = fileService.swiftOrgList
//            listOrganizationsVC.purpleGiraffeList = fileService.purpleGiraffeList
//            listOrganizationsVC.cwcList = fileService.cwcList
//            listOrganizationsVC.codinGameList = fileService.codinGameList
//            listOrganizationsVC.microsoftList = fileService.microsoftList
//            listOrganizationsVC.raywenderlichList = fileService.raywenderlichList
//            listOrganizationsVC.learnGitBranchingList = fileService.learnGitBranchingList
//            listOrganizationsVC.openClassroomsList = fileService.openClassroomsList
//            listOrganizationsVC.diversList = fileService.diversList
        }
    }
}
