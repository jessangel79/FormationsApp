//
//  InformationsViewController.swift
//  FormationsApp
//
//  Created by Angelique Babin on 10/07/2020.
//  Copyright © 2020 Angelique Babin. All rights reserved.
//

import UIKit

final class InformationsViewController: UIViewController {
    
    // MARK: - Properties
    
    private let segueToWebsiteInfo = "segueToWebsiteInfo"
    private let badgeLinkedIn = "https://www.linkedin.com/mwlite/in/ang%C3%A9lique-babin-158aa874"
    private let badgeDevTo = "https://dev.to/angelappdev"
    private var badge = String()
    
    // MARK: - Actions
    
    @IBAction private func freepikButtonTapped(_ sender: UIButton) {
        openSafari("https://www.flaticon.com/authors/freepik")
    }
    
    @IBAction private func eucalypButtonTapped(_ sender: UIButton) {
        openSafari("https://www.flaticon.com/authors/eucalyp")
    }
    
    @IBAction private func flatIconButtonTapped(_ sender: UIButton) {
        openSafari("https://www.flaticon.com/authors/flat-icons")
    }
    
    @IBAction private func smashiconsButtonTapped(_ sender: UIButton) {
        openSafari("https://www.flaticon.com/authors/smashicons")
    }
    
    @IBAction private func becrisButtonTapped(_ sender: UIButton) {
        openSafari("https://www.flaticon.com/authors/becris")
    }

    @IBAction private func phatplusButtonTapped(_ sender: UIButton) {
        openSafari("https://www.flaticon.com/authors/phatplus")
    }
    
    @IBAction private func nhorPhaiButtonTapped(_ sender: UIButton) {
        openSafari("https://www.flaticon.com/authors/nhor-phai")
    }
    
    @IBAction private func flatIconComButtonTapped(_ sender: UIButton) {
        openSafari("https://www.flaticon.com/")
    }
    
    @IBAction private func badgeLinkedInButtonTapped(_ sender: UIButton) {
        badge = badgeLinkedIn
        performSegue(withIdentifier: segueToWebsiteInfo, sender: self)
    }
    
    @IBAction private func badgeDevToButtonTapped(_ sender: UIButton) {
        badge = badgeDevTo
        performSegue(withIdentifier: segueToWebsiteInfo, sender: self)
    }
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isToolbarHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isToolbarHidden = true
    }
}

// MARK: - Navigation

extension InformationsViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToWebsiteInfo {
            guard let websiteInfoVC = segue.destination as? WebViewInformationsViewController else { return }
            websiteInfoVC.badge = self.badge
        }
    }
}
