//
//  FollowersListVC.swift
//  Socialends
//
//  Created by Thanasis Galanis on 29/12/23.
//

import UIKit

class FollowersListVC: UIViewController {
    
    enum Section {
        case main
    }
    
    var username: String?
    var followers: [Follower] = []
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
        configDataSource()
        loadFollowers()
    }
    
    private func loadFollowers() {
        guard let username = self.username else { return }
        NetworkManager.shared.getFollowers(for: username, page: 1) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .failure(let error):
                self.presentSEAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "OK")
            case .success(let followers):
                print("followers: \(followers.count)")
                print(followers)
                self.followers = followers
                self.updateData()
            }
        }
    }
    
    private func configCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
    }
    
    private func configDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: collectionView, cellProvider: { collectionView, indexPath, follower in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseID, for: indexPath) as! FollowerCell
            cell.set(follower: follower)
            return cell
        })
    }
    
    func updateData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(followers)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
}
