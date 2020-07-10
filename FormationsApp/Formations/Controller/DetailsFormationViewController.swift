//
//  DetailsFormationViewController.swift
//  FormationsApp
//
//  Created by Angelique Babin on 26/06/2020.
//  Copyright © 2020 Angelique Babin. All rights reserved.
//

import UIKit

final class DetailsFormationViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var logoOrgImageView: UIImageView!
    @IBOutlet weak var organizationLabel: UILabel!
    @IBOutlet weak var logoLangageImageview: UIImageView!
    @IBOutlet weak var langageLabel: UILabel!
    @IBOutlet weak var nameFormationLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet weak var detailsTextView: UITextView!
    @IBOutlet weak var websiteButton: UIButton!
    @IBOutlet var subtitleLabels: [UILabel]!
    
    // MARK: - Properties
    
    var cellule: Langages?
    var allFileDict = [String: [Langages]]()
    private let segueToWebsite = Constants.SegueToWebsite
    
    // MARK: - Actions
    
    @IBAction func websiteButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: self.segueToWebsite, sender: self)
    }
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureFormation()
        customAllLabels(allLabels: subtitleLabels, radius: 15, colorBackground: .systemGray3)
        customButton(button: websiteButton, radius: 15, width: 2.0, colorBackground: .systemGray5, colorBorder: #colorLiteral(red: 0.3465234637, green: 0.05713232607, blue: 0.1905708015, alpha: 1))
        websiteButton.showsTouchWhenHighlighted = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    // MARK: - Methods
    
    private func configureFormation() {
        organizationLabel.text = cellule?.organization
        langageLabel.text = cellule?.langageName
        nameFormationLabel.text = cellule?.formation
        startDateLabel.text = cellule?.startDate
        endDateLabel.text = cellule?.endDate
        setColorState(state: cellule?.state ?? Constants.ToDo)
        stateLabel.text = cellule?.state
        notesTextView.text = cellule?.note
        detailsTextView.text = cellule?.detail
        loadImageFormations(Organizations(rawValue: cellule?.organization ?? "") ?? Organizations.divers)
        loadImageLangages(LangagesString(rawValue: cellule?.langageName ?? "") ?? LangagesString.others)
    }
    
    private func setColorState(state: String) {
        let stateTemp: States = States(rawValue: state) ?? .toDo
        switch stateTemp {
        case .toDo:
            stateLabel.textColor = .blue
        case .inProgress:
            stateLabel.textColor = .red
        default:
            stateLabel.textColor = #colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1)
        }
    }
    
    private func loadImageFormations(_ organizationsFile: Organizations) {
        switch organizationsFile {
        case .cwc:
            logoOrgImageView.image = UIImage(named: Organizations.cwc.rawValue.lowercased() + ".png")
        case .codinGame:
            logoOrgImageView.image = UIImage(named: Organizations.codinGame.rawValue.lowercased() + ".png")
        case .coursera:
            logoOrgImageView.image = UIImage(named: Organizations.coursera.rawValue.lowercased() + ".png")
        case .divers:
            logoOrgImageView.image = UIImage(named: Organizations.divers.rawValue.lowercased() + ".png")
        case .hws:
            logoOrgImageView.image = UIImage(named: Organizations.hws.rawValue.lowercased() + ".png")
        case .learnGitBranching:
            logoOrgImageView.image = UIImage(named: Organizations.learnGitBranching.rawValue.lowercased() + ".png")
        case .microsoft:
            logoOrgImageView.image = UIImage(named: Organizations.microsoft.rawValue.lowercased() + ".png")
        case .openClassrooms:
            logoOrgImageView.image = UIImage(named: Organizations.openClassrooms.rawValue.lowercased() + ".png")
        case .purpleGiraffe:
            logoOrgImageView.image = UIImage(named: Organizations.purpleGiraffe.rawValue.lowercased() + ".png")
        case .raywenderlich:
            logoOrgImageView.image = UIImage(named: Organizations.raywenderlich.rawValue.lowercased() + ".png")
        case .swiftOrg:
            logoOrgImageView.image = UIImage(named: Organizations.swiftOrg.rawValue.lowercased() + ".png")
        case .udemy:
            logoOrgImageView.image = UIImage(named: Organizations.udemy.rawValue.lowercased() + ".png")
        }
    }
    
    func loadImageLangages(_ langagesFile: LangagesString) {
        switch langagesFile {
        case .swift:
            logoLangageImageview.image = UIImage(named: Constants.Swift.lowercased() + ".png")
        case .swiftUi:
            logoLangageImageview.image = UIImage(named: Constants.SwiftUi.lowercased() + ".png")
        case .kotlin:
            logoLangageImageview.image = UIImage(named: Constants.Kotlin.lowercased() + ".png")
        case .htmlCss:
            logoLangageImageview.image = UIImage(named: Constants.HtmlCss.lowercased() + ".png")
        case .git:
            logoLangageImageview.image = UIImage(named: Constants.Git.lowercased() + ".png")
        case .others:
            logoLangageImageview.image = UIImage(named: Constants.Others.lowercased() + ".png")
        case .entrepreneuriat:
            logoLangageImageview.image = UIImage(named: Constants.Entrepreneuriat.lowercased() + ".png")
        case .crossPlateform:
            logoLangageImageview.image = UIImage(named: Constants.CrossPlateform.lowercased() + ".png")
        }
    }
}

// MARK: - Navigation

extension DetailsFormationViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToWebsite {
            guard let websiteVC = segue.destination as? WebsiteViewController else { return }
            websiteVC.cellule = self.cellule
            websiteVC.allFileDict = self.allFileDict
        }
    }
}