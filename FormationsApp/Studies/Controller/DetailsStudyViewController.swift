//
//  DetailsStudiesViewController.swift
//  FormationsApp
//
//  Created by Angelique Babin on 16/07/2020.
//  Copyright © 2020 Angelique Babin. All rights reserved.
//

import UIKit

final class DetailsStudyViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var certificationLabel: UILabel!
    @IBOutlet private weak var organizationLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var websiteButton: UIButton!
    @IBOutlet private weak var logoImageView: UIImageView!
    @IBOutlet private weak var logoThemeImageView: UIImageView!
    @IBOutlet private weak var themeLabel: UILabel!
    @IBOutlet private var subtitleLabels: [UILabel]!
        
    // MARK: - Properties

    var cellule: Studies?
    private let segueToWebsiteStudy = Constants.SegueToWebsiteStudy
        
    // MARK: - Actions
    
    @IBAction private func websiteButtonTapped(_ sender: UIButton) {
        if cellule?.link == "-" {
            presentAlert(typeError: .noDocument)
        } else {
            performSegue(withIdentifier: self.segueToWebsiteStudy, sender: self)
        }
    }
 
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        customAllLabels(allLabels: subtitleLabels, radius: 15, colorBackground: #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1))
        customButton(button: websiteButton, radius: 15, width: 2.0, colorBackground: #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1), colorBorder: #colorLiteral(red: 0.397138536, green: 0.09071742743, blue: 0.3226287365, alpha: 1))
        configureStudy()
        websiteButton.showsTouchWhenHighlighted = true
        navigationController?.isToolbarHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isToolbarHidden = true
    }
    
    // MARK: - Methods

    private func configureStudy() {
        certificationLabel.text = cellule?.certification
        organizationLabel.text = cellule?.organization
        themeLabel.text = cellule?.theme
        loadImage(OrgStudies(rawValue: cellule?.organization ?? "") ?? OrgStudies.company)
        loadImageTheme(Themes(rawValue: cellule?.theme ?? "") ?? Themes.various)
        setDate()
    }
    
    private func setDate() {
        guard let dateIsEmpty = cellule?.date?.isEmpty else { return }
        if dateIsEmpty {
            dateLabel.text = "Non validé"
        } else {
            dateLabel.text = cellule?.date
        }
    }
    
    private func loadImage(_ orgStudies: OrgStudies) {
        let lyceeLouisJouvet = OrgStudies.lyceeLouisJouvet.rawValue.cutEndString(stringElementOf: "-").removeAccent(stringOf: "é").deleteWhitespaces
        let lyceeDiderot = OrgStudies.lyceeDiderot.rawValue.cutEndString(stringElementOf: "-").removeAccent(stringOf: "é").deleteWhitespaces
        switch orgStudies {
        case .openClassrooms:
            logoImageView.image = UIImage(named: OrgStudies.openClassrooms.rawValue + ".png")
        case .orsys:
            logoImageView.image = UIImage(named: OrgStudies.orsys.rawValue + ".png")
        case .soloLearn:
            logoImageView.image = UIImage(named: OrgStudies.soloLearn.rawValue + ".png")
        case .plusNouvellesTechnologies:
            logoImageView.image = UIImage(named: OrgStudies.plusNouvellesTechnologies.rawValue.deleteWhitespaces + ".png")
        case .lyceeLouisJouvet:
            logoImageView.image = UIImage(named: lyceeLouisJouvet + ".jpg")
        case .lyceeDiderot:
            logoImageView.image = UIImage(named: lyceeDiderot + ".png")
        case .purpleGiraffe:
            logoImageView.image = UIImage(named: OrgStudies.purpleGiraffe.rawValue.lowercased() + ".png")
        default:
            logoImageView.image = UIImage(named: OrgStudies.company.rawValue + ".png")
        }
    }
    
    private func loadImageTheme(_ themes: Themes) {
        switch themes {
        case .swift:
            logoThemeImageView.image = UIImage(named: Themes.swift.rawValue + ".png")
        case .swiftUi:
            logoThemeImageView.image = UIImage(named: Themes.swiftUi.rawValue.removeWhitespaces + ".png")
        case .kotlin:
            logoThemeImageView.image = UIImage(named: Themes.kotlin.rawValue + ".png")
        case .java:
            logoThemeImageView.image = UIImage(named: Themes.java.rawValue + ".png")
        case .htmlCss:
            logoThemeImageView.image = UIImage(named: Themes.htmlCss.rawValue + ".jpg")
        case .python:
            logoThemeImageView.image = UIImage(named: Themes.python.rawValue + ".png")
        case .git:
            logoThemeImageView.image = UIImage(named: Themes.git.rawValue + ".png")
        case .crossPlateform:
            logoThemeImageView.image = UIImage(named: Themes.crossPlateform.rawValue + ".png")
        case .entrepreneuriat:
            logoThemeImageView.image = UIImage(named: Themes.entrepreneuriat.rawValue + ".png")
        case .projectManagement:
            logoThemeImageView.image = UIImage(named: Themes.projectManagement.rawValue.removeWhitespaces + ".jpg")
        case .systemAdministration:
            logoThemeImageView.image = UIImage(named: Themes.systemAdministration.rawValue.removeWhitespaces.removeAccent(stringOf: "è") + ".png")
        case .development:
            logoThemeImageView.image = UIImage(named: Themes.development.rawValue.removeWhitespaces.removeAccent(stringOf: "é") + ".png")
        default:
            logoThemeImageView.image = UIImage(named: Themes.various.rawValue.lowercased() + ".png")
        }
    }
}

// MARK: - Navigation

extension DetailsStudyViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToWebsiteStudy {
            guard let websiteStudyVC = segue.destination as? WebsiteStudyViewController else { return }
            websiteStudyVC.cellule = self.cellule
        }
    }
}
