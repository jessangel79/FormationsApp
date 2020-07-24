//
//  UIViewController+Alert.swift
//  FormationsApp
//
//  Created by Angelique Babin on 16/07/2020.
//  Copyright © 2020 Angelique Babin. All rights reserved.
//

import UIKit

// MARK: - Extension to display an alert message to the user

extension UIViewController {
    
    /// Enumeration of the error
    enum AlertError {
        case noDocument
        case offline
    }

    /// Alert message for user
    func presentAlert(typeError: AlertError) {
        var message: String
        var title: String
      
        switch typeError {
        case .noDocument:
            title = "No document"
            message = "Sorry there is no document"
        case .offline:
            title = "Not available online"
            message = "Sorry this document is only available offline"
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
