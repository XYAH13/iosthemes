//
//  ThirdViewController.swift
//  test3
//
//  Created by Yurik on 17.7.20.
//  Copyright © 2020 Yurik. All rights reserved.
//

import UIKit

class ThirdViewController: BaseViewController {
    
    override var title: String? {
        get { return "Third" }
        set { }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureColors()
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    override func configureColors() {
        super.configureColors()
    }
}

extension ThirdViewController {
    
    @IBAction func didFirstBtnClick(_ sender: Any) {
        switch ColorThemeManager.shared.currentColorTheme {
        case .white: ColorThemeManager.shared.switchTheme(to: .dark)
        case .dark: ColorThemeManager.shared.switchTheme(to: .white)
        default: break
        }
    }
    
    @IBAction func didSecondBtnClick(_ sender: Any) {
        self.present(ThirdViewController(), animated: true, completion: nil)
    }
    
    @IBAction func didCloseBtnClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
