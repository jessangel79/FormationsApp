//
//  DetailsSkillViewController.swift
//  FormationsApp
//
//  Created by Angelique Babin on 09/07/2020.
//  Copyright © 2020 Angelique Babin. All rights reserved.
//

import UIKit

class DetailsSkillViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var formationLabel: UILabel!
    @IBOutlet weak var knowledgeTextView: UITextView!
    @IBOutlet weak var degreeLabel: UILabel!
    @IBOutlet weak var knowledgeTitleTextView: UITextView!
    @IBOutlet weak var websiteButton: UIButton!
    
    // MARK: - Properties

    var cellule: Skills?
    var fileService = FileService()
    var allSkillsList = [Skills]()
    private let segueToWebsiteSkill = Constants.SegueToWebsiteSkill
        
    // MARK: - Actions
    
    @IBAction func websiteButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: self.segueToWebsiteSkill, sender: self)
    }
 
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSkill()
        setWebsiteButton()
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
            websiteButton.setTitle("AngelAppDev.io", for: .normal)
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
