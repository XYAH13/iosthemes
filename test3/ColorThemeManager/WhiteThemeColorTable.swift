//
//  ColorThemeManagerColors.swift
//  test3
//
//  Created by Yurik on 17.7.20.
//  Copyright © 2020 Yurik. All rights reserved.
//

import UIKit

extension ColorThemeManager {
    class WhiteThemeColorTable: ColorTable {
        static func getUIColor(by color: Color) -> UIColor {
            switch color {
            case .text: return UIColor(rgb: 0x000000)
            // Backgrounds
            case .background: return UIColor(rgb: 0xffffff)
            case .translucentNavBarBackground: return UIColor(rgb: 0xffffff)
            // TableViews
            case .tableSeparator: return UIColor(rgb: 0xc7c7cc)
            }
        }
    }
}
