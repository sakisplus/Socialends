//
//  FollowersListVC.swift
//  Socialends
//
//  Created by Thanasis Galanis on 29/12/23.
//

import UIKit

class FollowersListVC: UIViewController {
    
    var username: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        loadFollowers()
        
    }
    
    private func loadFollowers() {
        guard let username = self.username else { return }
        NetworkManager.shared.getFollowers(for: username, page: 1) { result in
            switch result {
            case .failure(let error):
                self.presentSEAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "OK")
            case .success(let followers):
                print("followers: \(followers.count)")
                print(followers)
            }
        }
    }
}
