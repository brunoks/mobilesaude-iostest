//
//  FavoriteViewController.swift
//  MobileSaude-testeios
//
//  Created by Mac Novo on 09/01/19.
//  Copyright © 2019 Bruno iOS Dev. All rights reserved.
//

import UIKit

class FavoriteViewController: BaseTableViewController<FavoriteViewCell, FavoriteViewModel> {
    
    deinit {
        print("Everything ok")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.getFavoriteNews()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem?.tintColor = .lightGreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureViewController()
        self.configurationDidSelect()
    }
    
    fileprivate func getFavoriteNews() {
        self.items = []
        let save = SaveNews()
        save.fetchAllFavorite { [weak self] (news) in
            print(news.count)
            if news.count > 0 {
                let datamodel = news.map( {return FavoriteModel(notificias: $0)} )
                let datavmodel = datamodel.map( {return FavoriteViewModel(model: $0)} )
                self?.items = datavmodel.sorted(by: { $0.data > $1.data } )
            }
        }
        self.tableView.reloadData()
    }
    
    
    
    //MARK:Call ViewControllers
    fileprivate func configureViewController() {
        self.title = "Favoritos"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-ordem-alfabética-30"), landscapeImagePhone: nil, style: .plain, target: self, action: #selector(orderBy))
    }
    
    
    
    @objc fileprivate func orderBy() {
        if self.items.first!.data > self.items.last!.data {
            self.items = self.items.sorted(by: { return $0.data < $1.data} )
        } else {
            self.items = self.items.sorted(by: { return $0.data > $1.data} )
        }
        self.tableView.reloadData()
    }
    
    
    
    fileprivate func configurationDidSelect() {
        didSelect = { [weak self] (select) in
            let viewc = NewsDetailViewController()
            viewc.id = select!.id
            self?.navigationController?.pushViewController(viewc, animated: true)
        }
    }
    
}
