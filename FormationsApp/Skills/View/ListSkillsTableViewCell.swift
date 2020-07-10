//
//  ListSkillsTableViewCell.swift
//  FormationsApp
//
//  Created by Angelique Babin on 09/07/2020.
//  Copyright © 2020 Angelique Babin. All rights reserved.
//

import UIKit

final class ListSkillsTableViewCell: UITableViewCell {
       
    // MARK: - Outlets
    
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

    // MARK: - View Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
