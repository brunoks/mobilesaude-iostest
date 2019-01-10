//
//  NewsDetailsCell.swift
//  MobileSaude-testeios
//
//  Created by Mac Novo on 08/01/19.
//  Copyright © 2019 Bruno iOS Dev. All rights reserved.
//

import UIKit

class NewsDetailsView: UIView {
    let titlebackground: UIView = {
        let img = UIView()
        img.layer.cornerRadius = 3
        img.backgroundColor = .white
        img.layer.shadowColor = UIColor.lightGray.cgColor
        img.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        img.layer.shadowOpacity = 0.3
        return img
    }()
    
    let titlenew: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 10
        label.textColor = .darkGray
        return label
    }()
    let datenew: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont(name: "Avenir", size: 14)
        return label
    }()
    let contentnew: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 16)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 200
        label.textColor = .darkGray
        return label
    }()
    let categorynew: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.textColor = .lightGreen
        return label
    }()
    let favoritedButton: LikeView! = {
        let button = LikeView()
        return button
    }()
    
    var item: DetailsViewModel! {
        didSet {
            self.titlenew.text = item.titulo
            self.contentnew.text = item.conteudo
            self.datenew.text = item.data
            self.categorynew.text = item.categorias_nomes
        }
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    fileprivate func configure() {
        self.addSubview(self.titlebackground)
        self.titlebackground.addSubview(self.titlenew)
        self.titlebackground.addSubview(self.favoritedButton)
        
        self.addSubview(self.contentnew)
        self.addSubview(self.datenew)
        self.addSubview(self.categorynew)
        
        
        self.titlebackground.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: self.titlenew.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 0, left: 0, bottom: -10, right: 0))
        self.favoritedButton.anchor(top: nil, leading: nil, bottom: self.titlebackground.bottomAnchor, trailing: self.titlebackground.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 5, right: 10), size: .init(width: 50, height: 50))
        
        self.titlenew.anchor(top: self.titlebackground.topAnchor, leading: self.titlebackground.leadingAnchor, bottom: nil, trailing: self.favoritedButton.leadingAnchor, padding: .init(top: 10, left: 15, bottom: 0, right: 10))
        
        self.datenew.anchor(top: self.titlebackground.bottomAnchor, leading: self.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 10, left: 10, bottom: 0, right: 0))
        
        self.contentnew.anchor(top: self.datenew.bottomAnchor, leading: self.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .init(top: 10, left: 10, bottom: 0, right: 10))
        
        self.categorynew.anchor(top: self.titlebackground.bottomAnchor, leading: nil, bottom: nil, trailing: self.trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 10))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
