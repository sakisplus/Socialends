//
//  UIHelper.swift
//  Socialends
//
//  Created by Thanasis Galanis on 30/12/23.
//

import UIKit

class UIHelper {
    
    static func createThreeColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
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
