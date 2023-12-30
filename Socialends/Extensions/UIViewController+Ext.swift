//
//  UIViewController+Ext.swift
//  Socialends
//
//  Created by Thanasis Galanis on 29/12/23.
//

import UIKit

fileprivate var containerView: UIView!

extension UIViewController {
    
    func presentSEAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = SEAlertVC(alertTitle: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
    
    func showLoadingIndicator() {
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0
        
        UIView.animate(withDuration: 0.25) {
            containerView.alpha = 0.8
        }
        
        let indicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(indicator)
        
        indicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        indicator.startAnimating()
    }
    
    func dismissLoadingIndicator() {
        DispatchQueue.main.async {
            containerView.removeFromSuperview()
            containerView = nil
        }
    }
    
    func showEmptyStateView(with message: String, in view: UIView) {
        let emptyStateView = SEEmptyState(message: message)
        emptyStateView.frame = view.bounds
        view.addSubview(emptyStateView)
    }
}
