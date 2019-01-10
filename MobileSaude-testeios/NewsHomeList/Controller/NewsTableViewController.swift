//
//  ViewController.swift
//  MobileSaude-testeios
//
//  Created by Mac Novo on 08/01/19.
//  Copyright © 2019 Bruno iOS Dev. All rights reserved.
//

import UIKit

class NewsTableViewController: BaseTableViewController<HomeViewCell, HomeViewModel> {

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem?.tintColor = .lightGreen
    }
    
    deinit {
        print("Not Problems with memory leak")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        homeFetchData()
        configurationDidSelect()
    }
    
    
    
    //MARK: Configure TableViewController
    fileprivate func configureViewController() {
        tableView.accessibilityIdentifier = "myUniqueTableViewIdentifier"
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Notícias"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Favoritos", style: .plain, target: self, action: #selector(callFavoriteViewController))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-ordem-alfabética-30"), landscapeImagePhone: nil, style: .plain, target: self, action: #selector(orderBy))
    }
    
    @objc fileprivate func orderBy() {
        if self.items.first!.data > self.items.last!.data {
            self.items = self.items.sorted(by: { return $0.data < $1.data} )
        } else {
            self.items = self.items.sorted(by: { return $0.data > $1.data} )
        }
        self.tableView.reloadData()
    }
    
    
    //MARK:Call ViewControllers
    @objc fileprivate func callFavoriteViewController() {
        let viewc = FavoriteViewController()
        self.navigationController?.pushViewController(viewc, animated: true)
    }
    
    
    
    fileprivate func configurationDidSelect() {
        didSelect = { [weak self] (select) in
            print(select!.titulo)
            let viewc = NewsDetailViewController()
            viewc.id = select!.id
            self?.navigationController?.pushViewController(viewc, animated: true)
        }
    }
    
    
    
    //MARK: Make APIRequest to feed TableView Data Source
    fileprivate func homeFetchData() {
        let home = HomeFetch()
        home.willStartHomeFetch { [weak self] (fetch: Array<HomeModel>) in
            self?.items = fetch.map( {return HomeViewModel(model: $0)} )
            self?.items = self!.items.sorted(by: { $0.data < $1.data })
            self?.tableView.reloadData()
        }
    }
    
    
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.transform = CGAffineTransform(translationX: 0, y: -20)
        UIView.animate(withDuration: 0.2, delay: 0.2, options: .allowUserInteraction, animations: {
            cell.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

