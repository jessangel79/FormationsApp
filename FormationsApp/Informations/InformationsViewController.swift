//
//  InformationsViewController.swift
//  FormationsApp
//
//  Created by Angelique Babin on 10/07/2020.
//  Copyright © 2020 Angelique Babin. All rights reserved.
//

import UIKit

final class InformationsViewController: UIViewController {
    
    // MARK: - Actions
    
    @IBAction func freepikButtonTapped(_ sender: UIButton) {
        let freepikUrl = "https://www.flaticon.com/authors/freepik"
        openSafari(urlString: freepikUrl)
    
    }
    
    @IBAction func flaticonButtonTapped(_ sender: UIButton) {
        let flaticonUrl = "https://www.flaticon.com/"
        openSafari(urlString: flaticonUrl)
    }
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Methods
    
    /// open url with safari
    private func openSafari(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        guard UIApplication.shared.canOpenURL(url) else { return }
        UIApplication.shared.open(url)
    }
}
