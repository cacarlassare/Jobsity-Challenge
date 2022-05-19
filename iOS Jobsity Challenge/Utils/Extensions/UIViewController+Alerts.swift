//
//  UIViewController+Alerts.swift
//  iOS Jobsity Challenge
//
//  Created by Cristian Carlassare on 18/05/2022.
//

import UIKit


extension UIViewController {
    
    func showErrorAlert(message: String) {
        let dismissButtonText = "Dismiss"
        
        let dismissButtonAction = UIAlertAction(title: dismissButtonText, style: .default) { _ in
            self.dismiss(animated: true, completion: nil)
        }
        
        self.showAlertController(message: message, actions: [dismissButtonAction], style: .alert)
    }
    
    // Generic Method
    private func showAlertController(title: String? = nil, message: String? = nil, actions: [UIAlertAction], style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        
        for action in actions {
            alertController.addAction(action)
        }
        
        self.present(alertController, animated: true, completion: nil)
    }
}
