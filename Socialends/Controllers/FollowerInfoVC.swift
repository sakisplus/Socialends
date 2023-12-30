//
//  FollowerInfoVC.swift
//  Socialends
//
//  Created by Thanasis Galanis on 30/12/23.
//

import UIKit

class FollowerInfoVC: UIViewController {
    
    var follower: Follower? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
        loadFollowerInfo()
    }
    
    func loadFollowerInfo() {
        guard let username = follower?.login else { return }
        NetworkManager.shared.getFollowerInfo(for: username) { result in
            switch result {
            case .failure(let error):
                print("\(error)")
                break
            case .success(let user):
                print(user)
            }
        }
    }
    
    @objc private func dismissVC() {
        dismiss(animated: true)
    }
}
