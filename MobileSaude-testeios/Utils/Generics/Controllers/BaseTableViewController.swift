//
//  BaseTableViewController.swift
//  MobileSaude-testeios
//
//  Created by Mac Novo on 08/01/19.
//  Copyright © 2019 Bruno iOS Dev. All rights reserved.
//

import UIKit

class BaseTableViewController<B: BaseCell<I>, I>: UITableViewController{

    let cellid = "id"
    var didSelect: (I?) -> () = { _ in }
    var items = [I]()
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(B.self, forCellReuseIdentifier: cellid)
        tableView.tableFooterView = UIView()
        let rc = UIRefreshControl()
        rc.tintColor = .white
        rc.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        tableView.refreshControl = rc
    }
    
    
    
    @objc func handleRefresh () {
        
    }
    
    
    //MARK: TableView Controller Functions
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.items[indexPath.row]
        self.didSelect(item)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as! BaseCell<I>
        cell.item = self.items[indexPath.row]
        cell.accessibilityIdentifier = "myCell_\(indexPath.row)"
        return cell
    }

    
    
}

class BaseCell<I>: UITableViewCell {
    var item: I!
}
