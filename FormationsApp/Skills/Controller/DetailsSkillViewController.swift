//
//  DetailsSkillViewController.swift
//  FormationsApp
//
//  Created by Angelique Babin on 09/07/2020.
//  Copyright © 2020 Angelique Babin. All rights reserved.
//

import UIKit

final class DetailsSkillViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var formationLabel: UILabel!
    @IBOutlet private weak var knowledgeTextView: UITextView!
    @IBOutlet private weak var degreeLabel: UILabel!
    @IBOutlet private weak var knowledgeTitleTextView: UITextView!
    @IBOutlet private weak var websiteButton: UIButton!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private var subtitleLabels: [UILabel]!
        
    // MARK: - Properties

    var cellule: Skills?
    var allSkillsList = [Skills]()
    private let segueToWebsiteSkill = Constants.SegueToWebsiteSkill
 
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        customAllLabels(allLabels: subtitleLabels, radius: 15, colorBackground: #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1))
        customLabel(label: titleLabel, radius: 15, colorBackground: #colorLiteral(red: 0.5808190107, green: 0.0884276256, blue: 0.3186392188, alpha: 1))
        customButton(button: websiteButton, radius: 15, width: 2.0, colorBackground: #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1), colorBorder: #colorLiteral(red: 0.3465234637, green: 0.05713232607, blue: 0.1905708015, alpha: 1))
        configureSkill()
        setWebsiteButton()
        navigationController?.isToolbarHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isToolbarHidden = true
    }
    
    // MARK: - Methods

    private func configureSkill() {
        formationLabel.text = cellule?.formation
        knowledgeTextView.text = cellule?.knowledge
        degreeLabel.text = cellule?.degree
        knowledgeTitleTextView.text = cellule?.knowledgeTitle
    }
    
    private func setWebsiteButton() {
        if cellule?.knowledgeTitle == allSkillsList[0].knowledgeTitle {
            websiteButton.setTitle("Parcours DA-iOS OC", for: .normal)
        } else if cellule?.formation ?? "" == allSkillsList[0].formation {
            websiteButton.setTitle("Soutenance", for: .normal)
        } else {
            websiteButton.setTitle("LinkedIn", for: .normal)
        }
        websiteButton.showsTouchWhenHighlighted = true
    }
}

// MARK: - Navigation

extension DetailsSkillViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToWebsiteSkill {
            guard let websiteSkillVC = segue.destination as? WebsiteSkillViewController else { return }
            websiteSkillVC.cellule = self.cellule
        }
    }
}
