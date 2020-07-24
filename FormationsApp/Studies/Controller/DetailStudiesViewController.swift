//
//  DetailStudiesViewController.swift
//  FormationsApp
//
//  Created by Angelique Babin on 16/07/2020.
//  Copyright © 2020 Angelique Babin. All rights reserved.
//

import UIKit

class DetailsStudyViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var certificationLabel: UILabel!
    @IBOutlet private weak var organizationLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var websiteButton: UIButton!
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private var subtitleLabels: [UILabel]!
        
    // MARK: - Properties

    var cellule: Studies?
    var allStudiesList = [Studies]()
    private let segueToWebsiteStudy = Constants.SegueToWebsiteStudy
        
    // MARK: - Actions
    
    @IBAction private func websiteButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: self.segueToWebsiteStudy, sender: self)
    }
 
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        customAllLabels(allLabels: subtitleLabels, radius: 15, colorBackground: #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1))
        customLabel(label: titleLabel, radius: 15, colorBackground: #colorLiteral(red: 0.5808190107, green: 0.0884276256, blue: 0.3186392188, alpha: 1))
        customButton(button: websiteButton, radius: 15, width: 2.0, colorBackground: #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1), colorBorder: #colorLiteral(red: 0.3465234637, green: 0.05713232607, blue: 0.1905708015, alpha: 1))
//        configureSkill()
        setWebsiteButton()
    }
    
    // MARK: - Methods

//    private func configureSkill() {
//        formationLabel.text = cellule?.formation
//        knowledgeTextView.text = cellule?.knowledge
//        degreeLabel.text = cellule?.degree
//        knowledgeTitleTextView.text = cellule?.knowledgeTitle
//    }
    
//    private func setWebsiteButton() {
//        if cellule?.knowledgeTitle == allSkillsList[0].knowledgeTitle {
//            websiteButton.setTitle("Parcours DA-iOS OC", for: .normal)
//        } else if cellule?.formation ?? "" == allSkillsList[0].formation {
//            websiteButton.setTitle("Soutenance", for: .normal)
//        } else {
//            websiteButton.setTitle("LinkedIn", for: .normal)
//            let image = UIImage(named: "linkedin.png")
//            websiteButton.setImage(image, for: .normal)
//        }
//        websiteButton.showsTouchWhenHighlighted = true
//    }
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
