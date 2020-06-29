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
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: - Properties
    
//    var langage: Langages? {
//        didSet {
//            nameLabel.text = langage?.langageNames.first
//            logoImageView.image = UIImage(named: langage?.langageNames.first ?? "") ///
//            loadImageLangages(LangagesString(rawValue: langage ?? "") ?? LangagesString.others) ///
//            print("langage in cell : \(langage?.langageNames.first ?? "error name langage")")
//        }
//    }
//
    var langage: String? {
        didSet {
            nameLabel.text = langage
            loadImageLangages(LangagesString(rawValue: langage ?? "") ?? LangagesString.others)
            print("langage in cell : \(langage ?? "error langage")")
        }
    }
    
    var organization: String? {
        didSet {
            nameLabel.text = organization
            loadImageOrganizations(Organizations(rawValue: organization ?? "") ?? Organizations.divers)
            print("organization in cell : \(organization ?? "error organization")")
        }
    }
    
    var formation: String? {
        didSet {
            nameLabel.text = formation
//            loadImageOrganizations(Organizations(rawValue: organization ?? "") ?? Organizations.divers)
            print("formation in cell : \(formation ?? "error formation")")
        }
    }
    
    // MARK: - View Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Methods
    
//    func loadImageLangages(_ langagesFile: Langages) {
//        logoImageView.image = UIImage(named: langage?.langageNames.first ?? "")
        
//        switch langagesFile {
//        case .swift:
//            logoImageView.image = UIImage(named: Constants.Swift.lowercased() + ".png")
//        case .swiftUi:
//            logoImageView.image = UIImage(named: Constants.SwiftUi.lowercased() + ".png")
//        case .kotlin:
//            logoImageView.image = UIImage(named: Constants.Kotlin.lowercased() + ".png")
//        case .htmlCss:
//            logoImageView.image = UIImage(named: Constants.HtmlCss.lowercased() + ".png")
//        case .git:
//            logoImageView.image = UIImage(named: Constants.Git.lowercased() + ".png")
//        case .others:
//            logoImageView.image = UIImage(named: Constants.Others.lowercased() + ".png")
//        case .entrepreneuriat:
//            logoImageView.image = UIImage(named: Constants.Entrepreneuriat.lowercased() + ".png")
//        case .crossPlateform:
//            logoImageView.image = UIImage(named: Constants.CrossPlateform.lowercased() + ".png")
//        }
//    }
    
    func loadImageLangages(_ langagesFile: LangagesString) {
        switch langagesFile {
        case .swift:
            logoImageView.image = UIImage(named: Constants.Swift.lowercased() + ".png")
        case .swiftUi:
            logoImageView.image = UIImage(named: Constants.SwiftUi.lowercased() + ".png")
        case .kotlin:
            logoImageView.image = UIImage(named: Constants.Kotlin.lowercased() + ".png")
        case .htmlCss:
            logoImageView.image = UIImage(named: Constants.HtmlCss.lowercased() + ".png")
        case .git:
            logoImageView.image = UIImage(named: Constants.Git.lowercased() + ".png")
        case .others:
            logoImageView.image = UIImage(named: Constants.Others.lowercased() + ".png")
        case .entrepreneuriat:
            logoImageView.image = UIImage(named: Constants.Entrepreneuriat.lowercased() + ".png")
        case .crossPlateform:
            logoImageView.image = UIImage(named: Constants.CrossPlateform.lowercased() + ".png")
        }
    }
    
    func loadImageOrganizations(_ organizationsFile: Organizations) {
        switch organizationsFile {
        case .cwc:
            logoImageView.image = UIImage(named: Organizations.cwc.rawValue.lowercased() + ".png")
        case .codinGame:
            logoImageView.image = UIImage(named: Organizations.codinGame.rawValue.lowercased() + ".png")
        case .coursera:
            logoImageView.image = UIImage(named: Organizations.coursera.rawValue.lowercased() + ".png")
        case .divers:
            logoImageView.image = UIImage(named: Organizations.divers.rawValue.lowercased() + ".png")
        case .hws:
            logoImageView.image = UIImage(named: Organizations.hws.rawValue.lowercased() + ".png")
        case .learnGitBranching:
            logoImageView.image = UIImage(named: Organizations.learnGitBranching.rawValue.lowercased() + ".png")
        case .microsoft:
            logoImageView.image = UIImage(named: Organizations.microsoft.rawValue.lowercased() + ".png")
        case .openClassrooms:
            logoImageView.image = UIImage(named: Organizations.openClassrooms.rawValue.lowercased() + ".png")
        case .purpleGiraffe:
            logoImageView.image = UIImage(named: Organizations.purpleGiraffe.rawValue.lowercased() + ".png")
        case .raywenderlich:
            logoImageView.image = UIImage(named: Organizations.raywenderlich.rawValue.lowercased() + ".png")
        case .swiftOrg:
            logoImageView.image = UIImage(named: Organizations.swiftOrg.rawValue.lowercased() + ".png")
        case .udemy:
            logoImageView.image = UIImage(named: Organizations.udemy.rawValue.lowercased() + ".png")
        }
    }
    
}
