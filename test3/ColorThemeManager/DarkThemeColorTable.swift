//
//  ColorThemeManagerDarkThemeColors.swift
//  test3
//
//  Created by Yurik on 17.7.20.
//  Copyright © 2020 Yurik. All rights reserved.
//

import UIKit

extension ColorThemeManager {
    class DarkThemeColorTable: ColorTable {
        static func getUIColor(by color: Color) -> UIColor {
            switch color {
            case .text: return UIColor(rgb: 0xffffff)
            // Backgrounds
            case .background: return UIColor(rgb: 0x222222)
            case .translucentNavBarBackground: return UIColor(rgb: 0x111111)
            // TableViews
            case .tableSeparator: return UIColor(rgb: 0x555555)
            }
        }
    }
}
