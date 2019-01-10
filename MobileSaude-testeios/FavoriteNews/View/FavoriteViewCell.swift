//
//  FavoriteViewCell.swift
//  MobileSaude-testeios
//
//  Created by Mac Novo on 09/01/19.
//  Copyright © 2019 Bruno iOS Dev. All rights reserved.
//

import UIKit

class FavoriteViewCell: BaseCell<FavoriteViewModel> {
    
    let imgbackground: UIView = {
        let img = UIView()
        img.layer.cornerRadius = 3
        img.backgroundColor = .white
        img.layer.shadowColor = UIColor.lightGray.cgColor
        img.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        img.layer.shadowOpacity = 0.3
        return img
    }()
    
    let imgnew: UIImageView = {
        let img = UIImageView()
        img.layer.cornerRadius = 3
        img.layer.shadowColor = UIColor.lightGray.cgColor
        img.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        img.layer.shadowOpacity = 0.3
        img.contentMode = .scaleAspectFill
        img.layer.masksToBounds = true
        return img
    }()
    let titlenew: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 10
        label.textColor = .darkGray
        return label
    }()
    let datenew: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont(name: "Avenir", size: 12)
        return label
    }()
    let categorynew: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.textColor = .lightGreen
        return label
    }()
    let indicatorimg: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "indicator")!.withRenderingMode(.alwaysTemplate)
        img.tintColor = .lightGray
        return img
    }()
    override var item: FavoriteViewModel! {
        didSet {
            self.titlenew.text = item.titulo
            self.categorynew.text = item.categorias_nomes
            self.datenew.text = item.data
            self.imgnew.sd_setImage(with: URL(string: item.foto_principal_url), placeholderImage: UIImage(named: "noprofile.png"))
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.separatorInset = UIEdgeInsets(top: 0, left: 125, bottom: 0, right: 0)
        configure()
    }
    fileprivate func configure() {
        self.addSubview(self.imgbackground)
        self.addSubview(self.imgnew)
        self.addSubview(self.titlenew)
        self.addSubview(self.categorynew)
        self.addSubview(self.datenew)
        self.addSubview(self.indicatorimg)
        
        self.imgbackground.anchor(top: self.imgnew.topAnchor, leading: self.imgnew.leadingAnchor, bottom: self.imgnew.bottomAnchor, trailing: self.imgnew.trailingAnchor)
        
        self.imgnew.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: nil, padding: .init(top: 15, left: 10, bottom: 15, right: 0), size: .init(width: 100, height: 0))
        self.categorynew.anchor(top: self.imgnew.topAnchor, leading: self.imgnew.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 10, bottom: 0, right: 0))
        
        self.titlenew.anchor(top: self.categorynew.bottomAnchor, leading: self.imgnew.trailingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 0, left: 10, bottom: 10, right: 15))
        
        self.indicatorimg.anchor(top: self.imgnew.topAnchor, leading: nil, bottom: nil, trailing: self.trailingAnchor, padding: .init(top: -5, left: 0, bottom: 0, right: 5), size: .init(width: 25, height: 25))
        
        self.datenew.anchorXY(centerX: nil, centerY: self.indicatorimg.centerYAnchor, top: nil, leading: nil, bottom: nil, trailing: self.indicatorimg.leadingAnchor)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
