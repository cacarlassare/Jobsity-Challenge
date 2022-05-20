//
//  UIViewController+Loading.swift
//  iOS Jobsity Challenge
//
//  Created by Cristian Carlassare on 19/05/2022.
//

import UIKit


fileprivate var loadingContainerView: UIView?


extension UIViewController {
    
    func showLoading() {
        loadingContainerView = UIView(frame: self.view.bounds)
        
        if let loadingContainerView = loadingContainerView {
            loadingContainerView.backgroundColor = .init(white: 0.5, alpha: 0.5)
            
            let indicator = UIActivityIndicatorView(style: .large)
            indicator.center = loadingContainerView.center
            indicator.color = .white
            indicator.startAnimating()
            
            loadingContainerView.addSubview(indicator)
            self.view.addSubview(loadingContainerView)
        }
    }
    
    func dismissLoading() {
        loadingContainerView?.removeFromSuperview()
        loadingContainerView = nil
    }
}
