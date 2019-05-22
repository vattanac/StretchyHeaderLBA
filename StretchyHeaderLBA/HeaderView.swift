//
//  HeaderView.swift
//  StretchyHeaderLBA
//
//  Created by Vattanac on 5/21/19.
//  Copyright © 2019 vattanac. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    let imageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "Image"))
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        
        addSubview(imageView)
        imageView.fillSuperview()
        
        //blur
        setupVisualEffectBlur()
    }
    var animator: UIViewPropertyAnimator!
    
    fileprivate func setupVisualEffectBlur() {
        
        animator = UIViewPropertyAnimator(duration: 3.0, curve: .linear, animations: {[weak self] in
            let blurEffect = UIBlurEffect(style: .regular)
            let visualEffectView = UIVisualEffectView(effect: blurEffect)
            
            self?.addSubview(visualEffectView)
            visualEffectView.fillSuperview()
        })
       //animator.startAnimation()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
