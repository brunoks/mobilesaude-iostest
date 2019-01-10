//
//  TopBarView.swift
//  MobileSaude-testeios
//
//  Created by Mac Novo on 08/01/19.
//  Copyright © 2019 Bruno iOS Dev. All rights reserved.
//

import UIKit

class TopBarView: UIView {
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    var item: DetailsViewModel! {
        didSet {
            self.imageView.sd_setImage(with: URL(string: item.foto_principal_url), placeholderImage: UIImage(named: "noprofile.png"))
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    fileprivate func configure() {
        self.addSubview(self.imageView)
        self.imageView.fillSuperview()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
