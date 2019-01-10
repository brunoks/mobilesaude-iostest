//
//  LikeView.swift
//  MobileSaude-testeios
//
//  Created by Mac Novo on 09/01/19.
//  Copyright © 2019 Bruno iOS Dev. All rights reserved.
//

import UIKit

class LikeView: UIView {
    
    let likebutton: UIButton = {
        let button = UIButton()
        button.isHidden = true
        button.setImage(#imageLiteral(resourceName: "like"), for: .normal)
        button.addTarget(self, action: #selector(didmakeAnimation), for: .touchUpInside)
        return button
    }()
    let unlikebutton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "unlike"), for: .normal)
        button.addTarget(self, action: #selector(didmakeAnimation), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    var isFavorited: Bool = false {
        didSet {
            if isFavorited {
                self.likebutton.isHidden = false
            } else {
                self.likebutton.isHidden = true
            }
        }
    }
    
    fileprivate func configure() {
        self.addSubview(self.unlikebutton)
        self.addSubview(self.likebutton)
        
        self.unlikebutton.fillSuperview(padding: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        self.likebutton.fillSuperview(padding: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    
    
    
    @objc fileprivate func didmakeAnimation() {
        if self.isFavorited {
            self.isFavorited = false
            UIView.animate(withDuration: 0.3, animations: {
                self.likebutton.transform = CGAffineTransform(scaleX: 0, y: 0)
            }) { (_) in
                self.likebutton.isHidden = true
            }
        } else {
            self.isFavorited = true
            self.likebutton.transform = CGAffineTransform(scaleX: 0, y: 0)
            self.likebutton.isHidden = false
            
            UIView.animate(withDuration: 0.3, animations: {
                self.likebutton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }, completion: nil)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
