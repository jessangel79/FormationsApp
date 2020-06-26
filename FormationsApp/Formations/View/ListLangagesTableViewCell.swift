//
//  ListTableViewCell.swift
//  FormationsApp
//
//  Created by Angelique Babin on 23/06/2020.
//  Copyright © 2020 Angelique Babin. All rights reserved.
//

import UIKit

final class ListLangagesTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var langageImageView: UIImageView!
    @IBOutlet weak var langageLabel: UILabel! // column D and E
    
    // MARK: - Properties
            
    var langage: String? {
        didSet {
            langageLabel.text = langage
            loadImageLangages(Langages(rawValue: langage ?? "") ?? Langages.others)
            print("langage in cell : \(langage ?? "error langage")")
        }
    }
    
    var organization: String? {
        didSet {
            langageLabel.text = organization
            loadImageOrganizations(Organizations(rawValue: organization ?? "") ?? Organizations.divers)
            print("organization in cell : \(organization ?? "error organization")")
        }
    }
        
    // MARK: - View Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Methods
    
    func loadImageLangages(_ langagesFile: Langages) {
        switch langagesFile {
        case .swift:
            langageImageView.image = UIImage(named: Constants.Swift.lowercased() + ".png")
        case .swiftUi:
            langageImageView.image = UIImage(named: Constants.SwiftUi.lowercased() + ".png")
        case .kotlin:
            langageImageView.image = UIImage(named: Constants.Kotlin.lowercased() + ".png")
        case .htmlCss:
            langageImageView.image = UIImage(named: Constants.HtmlCss.lowercased() + ".png")
        case .git:
            langageImageView.image = UIImage(named: Constants.Git.lowercased() + ".png")
        case .others:
            langageImageView.image = UIImage(named: Constants.Others.lowercased() + ".png")
        case .entrepreneuriat:
            langageImageView.image = UIImage(named: Constants.Entrepreneuriat.lowercased() + ".png")
        case .crossPlateform:
            langageImageView.image = UIImage(named: Constants.CrossPlateform.lowercased() + ".png")
        }
    }
    
    func loadImageOrganizations(_ organizationsFile: Organizations) {
        switch organizationsFile {
        case .codeWithChris:
            langageImageView.image = UIImage(named: Organizations.codeWithChris.rawValue.lowercased() + ".png")
        case .codinGame:
            langageImageView.image = UIImage(named: Organizations.codinGame.rawValue.lowercased() + ".png")
        case .coursera:
            langageImageView.image = UIImage(named: Organizations.coursera.rawValue.lowercased() + ".png")
        case .divers:
            langageImageView.image = UIImage(named: Organizations.divers.rawValue.lowercased() + ".png")
        case .hws:
            langageImageView.image = UIImage(named: Organizations.hws.rawValue.lowercased() + ".png")
        case .learnGitBranching:
            langageImageView.image = UIImage(named: Organizations.learnGitBranching.rawValue.lowercased() + ".png")
        case .microsoft:
            langageImageView.image = UIImage(named: Organizations.microsoft.rawValue.lowercased() + ".png")
        case .openClassrooms:
            langageImageView.image = UIImage(named: Organizations.openClassrooms.rawValue.lowercased() + ".png")
        case .purpleGiraffe:
            langageImageView.image = UIImage(named: Organizations.purpleGiraffe.rawValue.lowercased() + ".png")
        case .raywenderlich:
            langageImageView.image = UIImage(named: Organizations.raywenderlich.rawValue.lowercased() + ".png")
        case .swiftOrg:
            langageImageView.image = UIImage(named: Organizations.swiftOrg.rawValue.lowercased() + ".png")
        case .udemy:
            langageImageView.image = UIImage(named: Organizations.udemy.rawValue.lowercased() + ".png")
        }
    }
    
}
