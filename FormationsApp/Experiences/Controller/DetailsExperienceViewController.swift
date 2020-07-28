//
//  DetailsExperienceViewController.swift
//  FormationsApp
//
//  Created by Angelique Babin on 20/07/2020.
//  Copyright © 2020 Angelique Babin. All rights reserved.
//

import UIKit

final class DetailsExperienceViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var experienceLabel: UILabel!
    @IBOutlet private weak var companyLabel: UILabel!
    @IBOutlet private weak var startDateLabel: UILabel!
    @IBOutlet private weak var endDateLabel: UILabel!
    @IBOutlet private weak var websiteButton: UIButton!
    @IBOutlet private weak var jobImageView: UIImageView!
    @IBOutlet private weak var logoImageView: UIImageView!
    
    @IBOutlet private var subtitleLabels: [UILabel]!
        
    // MARK: - Properties

    var cellule: Experiences?
    private let segueToWebsiteExperience = Constants.SegueToWebsiteExperience
        
    // MARK: - Actions
    
    @IBAction private func websiteButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: self.segueToWebsiteExperience, sender: self)
    }
 
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        customAllLabels(allLabels: subtitleLabels, radius: 15, colorBackground: #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1))
        customButton(button: websiteButton, radius: 15, width: 2.0, colorBackground: #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1), colorBorder: #colorLiteral(red: 0.397138536, green: 0.09071742743, blue: 0.3226287365, alpha: 1))
        configureExperience()
        websiteButton.showsTouchWhenHighlighted = true
        navigationController?.isToolbarHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isToolbarHidden = true
    }
    
    // MARK: - Methods

    private func configureExperience() {
        experienceLabel.text = cellule?.experience
        loadImageJob(Jobs(rawValue: cellule?.experience ?? "") ?? Jobs.businesswoman)
        companyLabel.text = cellule?.company
        loadImageCompany(Companies(rawValue: cellule?.company ?? "") ?? Companies.company)
        startDateLabel.text = cellule?.startDate
        setEndDate()
    }
    
    private func setEndDate() {
        guard let endDateIsEmpty = cellule?.endDate?.isEmpty else { return }
        if endDateIsEmpty {
            endDateLabel.text = "Poste actuel"
        } else {
            endDateLabel.text = cellule?.endDate
        }
    }
    
    private func loadImageJob(_ jobs: Jobs) {
        let dev = jobs.rawValue.cutEndString(stringElementOf: "/").deleteWhitespaces
        switch jobs {
        case .developer:
            jobImageView.image = UIImage(named: dev + ".png")
        case .technician:
            jobImageView.image = UIImage(named: jobs.rawValue.deleteWhitespaces + ".png")
        case .agent:
            jobImageView.image = UIImage(named: jobs.rawValue.deleteWhitespaces + ".png")
        case .helpdesk:
            jobImageView.image = UIImage(named: jobs.rawValue.deleteWhitespaces + ".png")
        default:
            jobImageView.image = UIImage(named: Jobs.businesswoman.rawValue + ".png")
        }
    }
    
    private func loadImageCompany(_ companies: Companies) {
        switch companies {
        case .angelAppDev:
            logoImageView.image = UIImage(named: Companies.angelAppDev.rawValue.deleteWhitespaces + ".png")
        case .gva:
            logoImageView.image = UIImage(named: Companies.gva.rawValue + ".png")
        case .cafVo:
            logoImageView.image = UIImage(named: Companies.cafVo.rawValue.deleteWhitespaces + ".png")
        case .stime:
            logoImageView.image = UIImage(named: Companies.stime.rawValue.deleteWhitespaces + ".png")
        default:
            logoImageView.image = UIImage(named: Companies.company.rawValue + ".png")
        }
    }

}

// MARK: - Navigation

extension DetailsExperienceViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToWebsiteExperience {
            guard let websiteExpVC = segue.destination as? WebsiteExperienceViewController else { return }
            websiteExpVC.cellule = self.cellule
        }
    }
}
