//
//  MyCustomView.swift
//  test3
//
//  Created by Yurik on 17.7.20.
//  Copyright © 2020 Yurik. All rights reserved.
//

import UIKit

@IBDesignable
class MyCustomView: UIView {
    @IBOutlet weak var oneView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.fromNib()
        self.configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.fromNib()
        self.configure()
    }
    
    func configure() {
        self.configureColors()
    }
}

extension MyCustomView: ThemeAble {
    func configureColors() {
        self.oneView.backgroundColor = ColorThemeManager.shared.getUIColor(by: .text)
    }
}
