//
//  StrechyHeaderFlowLayout.swift
//  StretchyHeaderLBA
//
//  Created by Vattanac on 5/23/19.
//  Copyright © 2019 vattanac. All rights reserved.
//

import UIKit

class StrechyHeaderFlowLayout: UICollectionViewFlowLayout {

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        
        layoutAttributes?.forEach({ (attributes) in
            if attributes.representedElementKind == UICollectionView.elementKindSectionHeader {
                
                guard let collectionView = collectionView else {return}
                
                let contenOffsetY = collectionView.contentOffset.y
                
                if contenOffsetY > 0 {return}
                
                print(contenOffsetY)
                let width = collectionView.frame.width
                let height = attributes.frame.height - contenOffsetY
                //header
                attributes.frame = CGRect(x: 0, y: contenOffsetY, width: width, height: height)
                
            }
        })
        
        return layoutAttributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
