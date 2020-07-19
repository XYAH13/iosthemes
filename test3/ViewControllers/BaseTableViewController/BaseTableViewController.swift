//
//  BaseTableViewController.swift
//  test3
//
//  Created by Yurik on 18.7.20.
//  Copyright © 2020 Yurik. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController, ThemeAble {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        switch ColorThemeManager.shared.currentColorTheme {
        case .white: return .default
        case .dark: return .lightContent
        default: return .default
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureColors()
    }
    
    func configureColors() {
        self.tableView.backgroundColor = ColorThemeManager.shared.getUIColor(by: .background)
        self.tableView.separatorColor = ColorThemeManager.shared.getUIColor(by: .tableSeparator)
    }
}
