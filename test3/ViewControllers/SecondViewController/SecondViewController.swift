//
//  SecondViewController.swift
//  test3
//
//  Created by Yurik on 17.7.20.
//  Copyright © 2020 Yurik. All rights reserved.
//

import UIKit

class SecondViewController: BaseTableViewController {
    
//    @IBOutlet weak private var tableView: UITableView!
    
    override var title: String? {
        get { return "Second" }
        set { }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configure()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func configure() {
        self.navigationItem.largeTitleDisplayMode = .always
        self.configureSearchStubs()
        self.configureColors()
    }
    
    func configureSearchStubs() {
        self.navigationItem.searchController = MainSearchController(searchResultsController: nil)
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    override func configureColors() {
        super.configureColors()
        self.tableView.reloadData()
    }
}

extension SecondViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(indexPath.row)"
        cell.textLabel?.textColor = ColorThemeManager.shared.getUIColor(by: .text)
        cell.backgroundColor = ColorThemeManager.shared.getUIColor(by: .background)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 33
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(ThirdViewController(), animated: true)
    }
}
