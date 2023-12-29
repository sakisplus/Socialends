//
//  FollowersListVC.swift
//  Socialends
//
//  Created by Thanasis Galanis on 29/12/23.
//

import UIKit

class FollowersListVC: UIViewController {
    
    var username: String?
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configViewController()
        configCollectionView()
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
    
    private func configViewController() {
        view.backgroundColor = .systemYellow
    }
    
    private func configCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createColFlowLayout())
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBlue
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
    }
    
    private func createColFlowLayout() -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minItemsSpacing: CGFloat = 10
        let availableWidth = width - (padding * 2) - (minItemsSpacing * 2)
        let itemWidth = availableWidth / 3
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        return flowLayout
    }
}
