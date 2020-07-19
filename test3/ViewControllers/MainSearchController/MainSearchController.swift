//
//  MainSearchController.swift
//  test3
//
//  Created by Yurik on 18.7.20.
//  Copyright © 2020 Yurik. All rights reserved.
//

import UIKit

class MainSearchController: UISearchController {
    private var backgroundView: UIView?
    private var backgroundViewTopAnchorConstraint: NSLayoutConstraint?
    
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
        self.setupCustomViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if #available(iOS 13.0, *) {}
        else {
            let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
            self.backgroundViewTopAnchorConstraint?.constant = -statusBarHeight
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if #available(iOS 13.0, *) {}
        else {
            self.backgroundViewTopAnchorConstraint?.constant = 0
        }
    }
    
    func setupCustomViews() {
        if #available(iOS 13.0, *) {}
        else {
            self.setupBackgroundView()
            self.setupLineView()
        }
    }
    
    private func setupBackgroundView() {
        let searchBar = self.searchBar
        let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        let frame = searchBar.frame.insetBy(dx: 0, dy: -(statusBarHeight)).offsetBy(dx: 0, dy: -(statusBarHeight))
        let view = UIView(frame: frame)
        view.backgroundColor = ColorThemeManager.shared.getUIColor(by: .background)
        searchBar.subviews.first?.addSubview(view)
        searchBar.sendSubview(toBack: view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundViewTopAnchorConstraint = view.topAnchor.constraint(equalTo: self.searchBar.topAnchor, constant: 0)
        backgroundViewTopAnchorConstraint?.isActive = true
        view.leadingAnchor.constraint(equalTo: self.searchBar.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: self.searchBar.trailingAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.searchBar.bottomAnchor, constant: 0).isActive = true
        self.backgroundView = view
    }
    
    private func setupLineView() {
        let lineView = UIView(frame: .zero)
        lineView.backgroundColor = ColorThemeManager.shared.getUIColor(by: .background)
        self.searchBar.addSubview(lineView)

        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.leadingAnchor.constraint(equalTo: self.searchBar.leadingAnchor).isActive = true
        lineView.trailingAnchor.constraint(equalTo: self.searchBar.trailingAnchor).isActive = true
        lineView.bottomAnchor.constraint(equalTo: self.searchBar.bottomAnchor, constant: 1).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}
