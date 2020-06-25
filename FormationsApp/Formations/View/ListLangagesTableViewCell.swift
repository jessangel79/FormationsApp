//
//  ListTableViewCell.swift
//  FormationsApp
//
//  Created by Angelique Babin on 23/06/2020.
//  Copyright © 2020 Angelique Babin. All rights reserved.
//

import UIKit
//import CoreXLSX

final class ListLangagesTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var langageImageView: UIImageView!
    @IBOutlet weak var langageLabel: UILabel! // column D and E
    
    // MARK: - Properties
            
    var langage: String? {
        didSet {
            langageLabel.text = langage
            loadImageLangages(Langages(rawValue: langage ?? "") ?? Langages.others)
            print(langage ?? "error langage")
        }
    }
    
//    var organization: [String]? {
//        didSet {
//            langageLabel.text = organization?[0]
//
//            for org in organization ?? [""] {
//                langageLabel.text = org
//            }

//            langageLabel.text = organization
//            loadImageOrganizations(Organizations(rawValue: organization ?? "") ?? Organizations.divers)
//            print("organization in cell \(String(describing: organization))")
//            print(organization ?? "error organization")
//        }
//    }
    
    var organization: String? {
        didSet {
            langageLabel.text = organization

//            for org in organization ?? [""] {
//                langageLabel.text = org
//            }
            
//            langageLabel.text = organization
//            loadImageOrganizations(Organizations(rawValue: organization ?? "") ?? Organizations.divers)
//            print("organization in cell \(String(describing: organization))")
            print("organization in cell : \(organization ?? "error organization")")
        }
    }
    
    var swift: String? {
        didSet {
            langageLabel.text = swift
            print(swift ?? "error swift")

        }
    }
    var swiftUi: String? {
        didSet {
            langageLabel.text = swiftUi
            print(swiftUi ?? "error swiftUi")

        }
    }
    var kotlin: String? {
        didSet {
            langageLabel.text = kotlin
        }
    }
    var htmlCss: String? {
        didSet {
            langageLabel.text = htmlCss
        }
    }
    var git: String? {
        didSet {
            langageLabel.text = git
        }
    }
    var entrepreneuriat: String? {
        didSet {
            langageLabel.text = entrepreneuriat
        }
    }
    var crossPlateform: String? {
        didSet {
            langageLabel.text = crossPlateform
        }
    }
    var others: String? {
        didSet {
            langageLabel.text = others
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
            langageImageView.image = UIImage(named: Langages.swift.rawValue.lowercased() + ".png")
        case .swiftUI:
            langageImageView.image = UIImage(named: Langages.swiftUI.rawValue.lowercased() + ".png")
        case .kotlin:
            langageImageView.image = UIImage(named: Langages.kotlin.rawValue.lowercased() + ".png")
        case .htmlCss:
            langageImageView.image = UIImage(named: Langages.htmlCss.rawValue.lowercased() + ".png")
        case .git:
            langageImageView.image = UIImage(named: Langages.git.rawValue.lowercased() + ".png")
        case .others:
            langageImageView.image = UIImage(named: Langages.others.rawValue.lowercased() + ".png")
        case .entrepreneuriat:
            langageImageView.image = UIImage(named: Langages.entrepreneuriat.rawValue.lowercased() + ".png")
        case .crossPlateform:
            langageImageView.image = UIImage(named: Langages.crossPlateform.rawValue.lowercased() + ".png")
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
        case .learngitbranchingJsOrg:
            langageImageView.image = UIImage(named: Organizations.learngitbranchingJsOrg.rawValue.lowercased() + ".png")
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
