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
        
        //Gradient
        setupGradientLayer()
    }
    
    fileprivate func setupGradientLayer() {
        let gradienLayer = CAGradientLayer()
        gradienLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradienLayer.locations = [0.5, 1]
        
        //layer.addSublayer(gradienLayer)
        let gradientContainerView = UIView()
        addSubview(gradientContainerView)
        gradientContainerView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        
        gradientContainerView.layer.addSublayer(gradienLayer)
        gradienLayer.frame = self.bounds
        gradienLayer.frame.origin.y -= bounds.height
        
        let heavyLabel = UILabel()
        heavyLabel.text = "Surf the web for courses"
        heavyLabel.font = .systemFont(ofSize: 24, weight: .heavy)
        heavyLabel.textColor = .white
        
        let descriptionLabel = UILabel()
        descriptionLabel.text = "Go ont the website khmer to learn iOS everyday for everyone it's free for all of you come and get it"
        descriptionLabel.font = .systemFont(ofSize: 12, weight: .regular)
        descriptionLabel.textColor = .white
        descriptionLabel.numberOfLines = 0
        
        let stackView = UIStackView(arrangedSubviews: [heavyLabel, descriptionLabel])
        stackView.axis = .vertical
        
        addSubview(stackView)
        stackView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 16, right: 16))
    }
    
    var animator: UIViewPropertyAnimator!
    
    fileprivate func setupVisualEffectBlur() {
        
        animator = UIViewPropertyAnimator(duration: 3.0, curve: .linear, animations: {[weak self] in
            let blurEffect = UIBlurEffect(style: .regular)
            let visualEffectView = UIVisualEffectView(effect: blurEffect)
            
            self?.addSubview(visualEffectView)
            visualEffectView.fillSuperview()
        })
        
        animator.fractionComplete = 0
       //animator.startAnimation()
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
