//
//  NewsDetailViewController.swift
//  MobileSaude-testeios
//
//  Created by Mac Novo on 08/01/19.
//  Copyright © 2019 Bruno iOS Dev. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController {
    
    
    deinit {
        print("Everything should be ok")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = false
        
        let sve = SaveNews()
        if let data = sve.fetchFavorite(by: self.id), data.count > 0 {
            data.forEach( {print($0.titulo!)} )
            self.detailsView.favoritedButton.isFavorited = true
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        self.navigationController?.navigationBar.shadowImage = nil
        self.navigationController?.navigationBar.setNeedsLayout()
    }
    
    
    
    var id: Int!
    var item: DetailsViewModel!
    let cellid = "cellid"
    let tableView = UITableView()
    let topBar = TopBarView()
    let detailsView = NewsDetailsView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDetails()
        configureViewController()
    }
    
    
    
    @objc fileprivate func saveFavorites() {
        let save = SaveNews()
        if self.detailsView.favoritedButton.isFavorited {
            print("favorited")
            save.saveNews(with: self.item)
            let item = save.fetchFavorite(by: self.item.id)
            item!.forEach( {print($0.titulo!)} )
        } else {
            print("not favorited")
            save.deleFavorite(with: self.item.id)
        }
    }
    
    
    
    //MARK: Configure and fill ViewController
    fileprivate func fetchDetails() {
        let fetch = FetchDetails(id: self.id)
        fetch.willFetchDetails { [weak self] (feed: DetailsModel) in
            self?.item = DetailsViewModel(model: feed)
            self?.tableView.reloadData()
            self?.topBar.item = self?.item
            self?.detailsView.item = self?.item
        }
    }
    
    
    
    fileprivate func configureViewController() {
        self.view.backgroundColor = .white
        self.view.addSubview(self.topBar)
        self.view.addSubview(self.tableView)
        self.tableView.fillSuperview()
        
        self.tableView.tableFooterView = UIView()
        self.tableView.backgroundColor = .clear
        self.tableView.separatorStyle = .none
        self.tableView.allowsSelection = false
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.contentInset = UIEdgeInsets(top: 164, left: 0, bottom: 0, right: 0)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.cellid)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        self.detailsView.favoritedButton.unlikebutton.addTarget(self, action: #selector(saveFavorites), for: .touchUpInside)
        self.detailsView.favoritedButton.likebutton.addTarget(self, action: #selector(saveFavorites), for: .touchUpInside)
    
    }

    
    
}



extension NewsDetailViewController: UITableViewDelegate, UITableViewDataSource {
    //MARK: TableView Funcs
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let text = self.item.conteudo {
            let size = CGSize(width: self.view.frame.width - 20, height: 1000)
            let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
            let estimatedFrame = NSString(string: text).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16)], context: nil)
            return estimatedFrame.height + 235
        }
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellid, for: indexPath)
        cell.addSubview(self.detailsView)
        self.detailsView.fillSuperview()
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if item != nil {
            return 1
        }
        return 0
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        if(offset > 200){
            self.topBar.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: 0)
        } else {
            self.topBar.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: abs(offset))
        }
    }
}
