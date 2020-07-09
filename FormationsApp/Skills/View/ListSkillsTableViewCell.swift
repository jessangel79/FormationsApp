//
//  ListSkillsTableViewCell.swift
//  FormationsApp
//
//  Created by Angelique Babin on 09/07/2020.
//  Copyright © 2020 Angelique Babin. All rights reserved.
//

import UIKit

class ListSkillsTableViewCell: UITableViewCell {
       
    // MARK: - Outlets
    
//    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    // MARK: - Properties
    
    var knowledge: Skills? {
        didSet {
            titleLabel.text = knowledge?.knowledge
            subtitleLabel.text = knowledge?.formation
            print("langage in cell : \(String(describing: knowledge?.knowledge))")
        }
    }
    
//    var knowledge: String? {
//        didSet {
//            titleLabel.text = knowledge
//            print("langage in cell : \(knowledge ?? "error langage")")
//        }
//    }
    
//    var skill: Skills? {
//        didSet {
//            titleLabel.text = skill?.knowledge
//            print("formation in cell : \(String(describing: skill?.knowledge))")
//        }
//    }
    
    // MARK: - View Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Method
}
