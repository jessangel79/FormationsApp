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
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    
    // MARK: - Properties
    
    var knowledge: Skills? {
        didSet {
            titleLabel.text = knowledge?.knowledge
            subtitleLabel.text = knowledge?.formation
            print("knowledge in cell : \(String(describing: knowledge?.knowledge))")
        }
    }

    // MARK: - View Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
