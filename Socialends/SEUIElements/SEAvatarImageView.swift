//
//  SEAvatarImageView.swift
//  Socialends
//
//  Created by Thanasis Galanis on 30/12/23.
//

import UIKit

class SEAvatarImageView: UIImageView {
    let cache = NetworkManager.shared.cache
    let avatarPlaceholder = UIImage(named: "logo")!

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
    
    func downloadImage(from urlSting: String) {
        
        let cacheKey = NSString(string: urlSting)
        if let image = cache.object(forKey: cacheKey) {
            print("retreive image from cache")
            self.image = image
            return
        }
        
        print("downloadImage from \(urlSting)")
        guard let url = URL(string: urlSting) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            if error != nil { return }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            guard let data = data else { return }
            guard let image = UIImage(data: data) else { return }
            cache.setObject(image, forKey: cacheKey)
            DispatchQueue.main.async { self.image = image }
        }
        
        task.resume()
    }
}
