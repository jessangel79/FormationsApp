//
//  ListFormationsTableViewCell.swift
//  FormationsApp
//
//  Created by Angelique Babin on 24/07/2020.
//  Copyright © 2020 Angelique Babin. All rights reserved.
//

import UIKit

class ListFormationsTableViewCell: UITableViewCell {

    // MARK: - Outlets

    @IBOutlet private weak var logoImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!

    // MARK: - Properties

    var themes: String? {
        didSet {
            nameLabel.text = themes
            loadImageThemes(ThemesString(rawValue: themes ?? "") ?? ThemesString.others)
        }
    }

    var formations: Formations? {
        didSet {
            nameLabel.text = formations?.formation
            loadImageOrganizations(Orgs(rawValue: formations?.organization ?? "") ?? Orgs.divers)
        }
    }

    // MARK: - View Life Cycle

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Methods

    private func loadImageThemes(_ themes: ThemesString) {
        switch themes {
        case .swift:
            logoImageView.image = UIImage(named: ThemesString.swift.rawValue + ".png")
        case .swiftUi:
            logoImageView.image = UIImage(named: ThemesString.swiftUi.rawValue.removeWhitespaces + ".png")
        case .kotlin:
            logoImageView.image = UIImage(named: ThemesString.kotlin.rawValue + ".png")
        case .htmlCss:
            logoImageView.image = UIImage(named: ThemesString.htmlCss.rawValue + ".png")
        case .git:
            logoImageView.image = UIImage(named: ThemesString.git.rawValue + ".png")
        case .others:
            logoImageView.image = UIImage(named: ThemesString.others.rawValue.lowercased() + ".png")
        case .entrepreneuriat:
            logoImageView.image = UIImage(named: ThemesString.entrepreneuriat.rawValue + ".png")
        case .crossPlateform:
            logoImageView.image = UIImage(named: ThemesString.crossPlateform.rawValue + ".png")
        }
    }

    func loadImageOrganizations(_ organizations: Orgs) {
        switch organizations {
        case .udemy:
            logoImageView.image = UIImage(named: Orgs.udemy.rawValue.lowercased() + ".png")
        case .hws:
             logoImageView.image = UIImage(named: Orgs.hws.rawValue.lowercased() + ".png")
        case .coursera:
            logoImageView.image = UIImage(named: Orgs.coursera.rawValue.lowercased() + ".png")
        case .swiftOrg:
            logoImageView.image = UIImage(named: Orgs.swiftOrg.rawValue.lowercased() + ".png")
        case .purpleGiraffe:
            logoImageView.image = UIImage(named: Orgs.purpleGiraffe.rawValue.lowercased() + ".png")
        case .cwc:
            logoImageView.image = UIImage(named: Orgs.cwc.rawValue.lowercased() + ".png")
        case .codinGame:
            logoImageView.image = UIImage(named: Orgs.codinGame.rawValue.lowercased() + ".png")
        case .microsoft:
            logoImageView.image = UIImage(named: Orgs.microsoft.rawValue.lowercased() + ".png")
        case .raywenderlich:
            logoImageView.image = UIImage(named: Orgs.raywenderlich.rawValue.lowercased() + ".png")
        case .learnGitBranching:
            logoImageView.image = UIImage(named: Orgs.learnGitBranching.rawValue.lowercased() + ".png")
        case .openClassrooms:
            logoImageView.image = UIImage(named: Orgs.openClassrooms.rawValue.lowercased() + ".png")
        case .elevenLabs:
             logoImageView.image = UIImage(named: Orgs.elevenLabs.rawValue.lowercased() + ".png")
        case .swiftTuto:
            logoImageView.image = UIImage(named: Orgs.swiftTuto.rawValue.lowercased() + ".png")
        case .divers:
            logoImageView.image = UIImage(named: Orgs.divers.rawValue.lowercased() + ".png")
        }
    }

}
