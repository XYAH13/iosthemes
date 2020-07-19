//
//  MainSearchController.swift
//  test3
//
//  Created by Yurik on 18.7.20.
//  Copyright © 2020 Yurik. All rights reserved.
//

import UIKit

class MainSearchController: UISearchController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        switch ColorThemeManager.shared.currentColorTheme {
        case .white: return .default
        case .dark: return .lightContent
        default: return .default
        }
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override init(searchResultsController: UIViewController?) {
        super.init(searchResultsController: searchResultsController)
        self.dimsBackgroundDuringPresentation = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
}
