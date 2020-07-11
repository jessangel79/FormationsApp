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
    
    // MARK: - Properties
    
    var studies: Skills? {
        didSet {
            titleLabel.text = studies?.knowledge
            subtitleLabel.text = studies?.formation
            print("langage in cell : \(String(describing: studies?.knowledge))")
        }
    }

    // MARK: - View Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
