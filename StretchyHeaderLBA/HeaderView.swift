//
//  HeaderView.swift
//  StretchyHeaderLBA
//
//  Created by Vattanac on 5/21/19.
//  Copyright © 2019 vattanac. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
