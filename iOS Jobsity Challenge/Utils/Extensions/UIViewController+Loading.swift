//
//  UIViewController+Loading.swift
//  iOS Jobsity Challenge
//
//  Created by Cristian Carlassare on 19/05/2022.
//

import UIKit


extension UIViewController {
    
    func showLoading(message: String = "Loading") {
        
        let alertController = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.isUserInteractionEnabled = false
        activityIndicator.startAnimating()

        alertController.view.addSubview(activityIndicator)
        alertController.view.heightAnchor.constraint(equalToConstant: 95).isActive = true

        activityIndicator.centerXAnchor.constraint(equalTo: alertController.view.centerXAnchor, constant: 0).isActive = true
        activityIndicator.bottomAnchor.constraint(equalTo: alertController.view.bottomAnchor, constant: -20).isActive = true

        self.present(alertController, animated: false)
    }
    
    func dismissLoading() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.dismiss(animated: false, completion: nil)
        }
    }
}
