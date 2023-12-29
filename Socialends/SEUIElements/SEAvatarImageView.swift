//
//  SEAvatarImageView.swift
//  Socialends
//
//  Created by Thanasis Galanis on 30/12/23.
//

import UIKit

class SEAvatarImageView: UIImageView {
    
    let avatarPlaceholder = UIImage(named: "appstore")!

    override init(frame: CGRect) {
        super.init(frame: frame)
        config()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func config() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = avatarPlaceholder
        translatesAutoresizingMaskIntoConstraints = false
    }
}
