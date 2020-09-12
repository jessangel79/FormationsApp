//
//  UIViewController+CustomUI.swift
//  FormationsApp
//
//  Created by Angelique Babin on 10/07/2020.
//  Copyright © 2020 Angelique Babin. All rights reserved.
//

import UIKit

// MARK: - Extension to custom buttons, views and labels

extension UIViewController {

    /// custom button
    public func customButton(button: UIButton, radius: CGFloat, width: CGFloat, colorBackground: UIColor, colorBorder: UIColor) {
        button.layer.cornerRadius = radius
        button.layer.borderWidth = width
        button.layer.backgroundColor = colorBackground.cgColor
        button.layer.borderColor = colorBorder.cgColor
    }
    
    /// custom labels collection
    public func customAllLabels(allLabels: [UILabel], radius: CGFloat, colorBackground: UIColor) {
        for label in allLabels {
            customLabel(label: label, radius: radius, colorBackground: colorBackground)
        }
    }
    
    /// custom label
    public func customLabel(label: UILabel, radius: CGFloat, colorBackground: UIColor) {
        label.layer.cornerRadius = radius
        label.layer.backgroundColor = colorBackground.cgColor
    }
}
