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
    
    @IBOutlet private weak var logoOrgImageView: UIImageView!
    @IBOutlet private weak var organizationLabel: UILabel!
    @IBOutlet private weak var logoLangageImageview: UIImageView!
    @IBOutlet private weak var themeLabel: UILabel!
    @IBOutlet private weak var nameFormationLabel: UILabel!
    @IBOutlet private weak var startDateLabel: UILabel!
    @IBOutlet private weak var endDateLabel: UILabel!
    @IBOutlet private weak var stateLabel: UILabel!
    @IBOutlet private weak var notesTextView: UITextView!
    @IBOutlet private weak var detailsTextView: UITextView!
    @IBOutlet private weak var websiteButton: UIButton!
    @IBOutlet private var subtitleLabels: [UILabel]!
    
    // MARK: - Properties
    
    var cellule: Formations?
    private let segueToWebsiteFormation = Constants.SegueToWebsiteFormation
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        customAllLabels(allLabels: subtitleLabels, radius: 15, colorBackground: #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1))
        customButton(button: websiteButton, radius: 15, width: 2.0, colorBackground: #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1), colorBorder: #colorLiteral(red: 0.3465234637, green: 0.05713232607, blue: 0.1905708015, alpha: 1))
        configureFormation()
        websiteButton.showsTouchWhenHighlighted = true
        navigationController?.isToolbarHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isToolbarHidden = true
    }

    // MARK: - Methods
    
    private func configureFormation() {
        organizationLabel.text = cellule?.organization
        themeLabel.text = cellule?.theme
        nameFormationLabel.text = cellule?.formation
        startDateLabel.text = cellule?.startDate
        endDateLabel.text = cellule?.endDate
        setColorState(state: cellule?.state ?? Constants.ToDo)
        stateLabel.text = cellule?.state
        notesTextView.text = cellule?.note
        detailsTextView.text = cellule?.detail
        loadImageOrganizations(Orgs(rawValue: cellule?.organization ?? "") ?? Orgs.divers)
        loadImageThemes(ThemesString(rawValue: cellule?.theme ?? "") ?? ThemesString.others)
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
    
    private func loadImageOrganizations(_ organizations: Orgs) {
        switch organizations {
        case .udemy:
            logoOrgImageView.image = UIImage(named: Orgs.udemy.rawValue.lowercased() + ".png")
        case .hws:
             logoOrgImageView.image = UIImage(named: Orgs.hws.rawValue.lowercased() + ".png")
        case .coursera:
            logoOrgImageView.image = UIImage(named: Orgs.coursera.rawValue.lowercased() + ".png")
        case .swiftOrg:
            logoOrgImageView.image = UIImage(named: Orgs.swiftOrg.rawValue.lowercased() + ".png")
        case .purpleGiraffe:
            logoOrgImageView.image = UIImage(named: Orgs.purpleGiraffe.rawValue.lowercased() + ".png")
        case .cwc:
            logoOrgImageView.image = UIImage(named: Orgs.cwc.rawValue.lowercased() + ".png")
        case .codinGame:
            logoOrgImageView.image = UIImage(named: Orgs.codinGame.rawValue.lowercased() + ".png")
        case .microsoft:
            logoOrgImageView.image = UIImage(named: Orgs.microsoft.rawValue.lowercased() + ".png")
        case .raywenderlich:
            logoOrgImageView.image = UIImage(named: Orgs.raywenderlich.rawValue.lowercased() + ".png")
        case .learnGitBranching:
            logoOrgImageView.image = UIImage(named: Orgs.learnGitBranching.rawValue.lowercased() + ".png")
        case .openClassrooms:
            logoOrgImageView.image = UIImage(named: Orgs.openClassrooms.rawValue.lowercased() + ".png")
        case .elevenLabs:
            logoOrgImageView.image = UIImage(named: Orgs.elevenLabs.rawValue.lowercased() + ".png")
        case .swiftTuto:
            logoOrgImageView.image = UIImage(named: Orgs.swiftTuto.rawValue.lowercased() + ".png")
        case .divers:
            logoOrgImageView.image = UIImage(named: Orgs.divers.rawValue.lowercased() + ".png")
        }
    }
    
    private func loadImageThemes(_ themes: ThemesString) {
        switch themes {
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
        if segue.identifier == segueToWebsiteFormation {
            guard let websiteFormationVC = segue.destination as? WebsiteFormationViewController else { return }
            websiteFormationVC.cellule = self.cellule
        }
    }
}
