//
//  FirstViewController.swift
//  test3
//
//  Created by Yurik on 17.7.20.
//  Copyright © 2020 Yurik. All rights reserved.
//

import UIKit

class FirstViewController: BaseViewController {
    
    override var title: String? {
        get { return "First" }
        set { }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hbd_barStyle = .default
        self.hbd_barShadowHidden = true
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    override func configureColors() {
        super.configureColors()
    }
}

extension FirstViewController {
    @IBAction func didBtnClick(_ sender: Any) {
        self.navigationController?.pushViewController(SecondViewController(), animated: true)
    }
    
    @IBAction func didSecondBtnClick(_ sender: Any) {
        switch ColorThemeManager.shared.currentColorTheme {
        case .white: ColorThemeManager.shared.switchTheme(to: .dark)
        case .dark: ColorThemeManager.shared.switchTheme(to: .white)
        default: break
        }
    }
}
