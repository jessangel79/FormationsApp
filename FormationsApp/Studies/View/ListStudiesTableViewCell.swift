//
//  ListStudiesTableViewCell.swift
//  FormationsApp
//
//  Created by Angelique Babin on 10/07/2020.
//  Copyright © 2020 Angelique Babin. All rights reserved.
//

import UIKit

final class ListStudiesTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    
    // MARK: - Properties
    
    var studies: Studies? {
        didSet {
            titleLabel.text = studies?.certification
            subtitleLabel.text = studies?.organization
            loadImage(OrgStudies(rawValue: studies?.organization ?? "") ?? OrgStudies.company)
        }
    }
    
    var experiences: Experiences? {
        didSet {
            titleLabel.text = experiences?.experience
            subtitleLabel.text = experiences?.company
            loadImageCompany(Companies(rawValue: experiences?.company ?? "") ?? Companies.company)
        }
    }

    // MARK: - View Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Methods

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
        default:
            logoImageView.image = UIImage(named: OrgStudies.company.rawValue + ".png")
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
