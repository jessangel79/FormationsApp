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
    @IBOutlet weak var langageLabel: UILabel!
    
    // MARK: - Methods

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var langage: String? {
        didSet {
            langageLabel.text = "langages"
            langageImageView.image = UIImage(named: "")
        }
    }
    
}
