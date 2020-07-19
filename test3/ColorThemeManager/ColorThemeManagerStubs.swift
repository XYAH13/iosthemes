//
//  ColorThemeManagerStubs.swift
//  test3
//
//  Created by Yurik on 17.7.20.
//  Copyright © 2020 Yurik. All rights reserved.
//

import UIKit

protocol ThemeAble {
    func configureColors()
}

protocol ColorTable {
    static func getUIColor(by color: ColorThemeManager.Color) -> UIColor
}

extension ColorThemeManager {
    enum ColorTheme {
        case system
        case white
        case dark
    }
    
    enum Color {
        case text
        // Backgrounds
        case translucentNavBarBackground
        case background
        // TableViews
        case tableSeparator
    }
}
