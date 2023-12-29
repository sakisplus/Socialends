//
//  UIViewController+Ext.swift
//  Socialends
//
//  Created by Thanasis Galanis on 29/12/23.
//

import UIKit

extension UIViewController {
    
    func presentSEAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = SEAlertVC(alertTitle: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
}
