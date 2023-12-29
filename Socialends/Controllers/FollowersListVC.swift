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
        NetworkManager.shared.getFollowers(for: username, page: 1) { followers, error in
            guard let followers = followers else {
                self.presentSEAlertOnMainThread(title: "Something went wrong", message: error!.rawValue, buttonTitle: "OK")
                return
            }
            print("followers: \(followers.count)")
            print(followers)
        }
    }
}
