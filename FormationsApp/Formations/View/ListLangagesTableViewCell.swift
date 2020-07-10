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
    
    var langage: String? {
        didSet {
            nameLabel.text = langage
            loadImageLangages(LangagesString(rawValue: langage ?? "") ?? LangagesString.others)
            print("langage in cell : \(langage ?? "error langage")")
        }
    }
    
    var formation: Langages? {
        didSet {
            nameLabel.text = formation?.formation
            loadImageFormations(Organizations(rawValue: formation?.organization ?? "") ?? Organizations.divers)
            print("formation in cell : \(String(describing: formation?.formation))")
        }
    }
    
    // MARK: - View Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Methods
    
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
    
    func loadImageFormations(_ organizationsFile: Organizations) {
        switch organizationsFile {
        case .cwc:
            logoImageView.image = UIImage(named: Constants.Cwc + ".png")
        case .codinGame:
            logoImageView.image = UIImage(named: Constants.CodinGame + ".png")
        case .coursera:
            logoImageView.image = UIImage(named: Constants.Coursera + ".png")
        case .divers:
            logoImageView.image = UIImage(named: Constants.Divers + ".png")
        case .hws:
            logoImageView.image = UIImage(named: Constants.Hws + ".png")
        case .learnGitBranching:
            logoImageView.image = UIImage(named: Constants.LearnGitBranching + ".png")
        case .microsoft:
            logoImageView.image = UIImage(named: Constants.Microsoft + ".png")
        case .openClassrooms:
            logoImageView.image = UIImage(named: Constants.OpenClassrooms + ".png")
        case .purpleGiraffe:
            logoImageView.image = UIImage(named: Constants.PurpleGiraffe + ".png")
        case .raywenderlich:
            logoImageView.image = UIImage(named: Constants.Raywenderlich + ".png")
        case .swiftOrg:
            logoImageView.image = UIImage(named: Constants.SwiftOrg + ".png")
        case .udemy:
            logoImageView.image = UIImage(named: Constants.Udemy + ".png")
        }
    }
    
}
