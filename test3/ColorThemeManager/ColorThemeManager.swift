//
//  ColorThemeManager.swift
//  test3
//
//  Created by Yurik on 17.7.20.
//  Copyright © 2020 Yurik. All rights reserved.
//

import UIKit

class ColorThemeManager {
    static public var shared = ColorThemeManager()
    
    var currentColorTheme: ColorThemeManager.ColorTheme = .white
    
    func switchTheme(to theme: ColorThemeManager.ColorTheme) {
        self.currentColorTheme = theme
        self.reloadViewControllers()
    }
    
    private func reloadViewControllers() {
        if let rootViewController = AppDelegate.shared?.window?.rootViewController {
            self.reloadColorsVCAndChilds(vc: rootViewController)
        }
        if let window = AppDelegate.shared?.window {
            self.reloadColorsSubviews(view: window)
        }
    }
    
    private func reloadColorsVCAndChilds(vc: UIViewController) {
        (vc as? ThemeAble)?.configureColors()
        for childVC in vc.childViewControllers { self.reloadColorsVCAndChilds(vc: childVC) }
        if let presentedVC = vc.presentedViewController { self.reloadColorsVCAndChilds(vc: presentedVC) }
    }
    
    private func reloadColorsSubviews(view: UIView) {
        (view as? ThemeAble)?.configureColors()
        for subview in view.subviews { self.reloadColorsSubviews(view: subview) }
    }
}

extension ColorThemeManager {
    func getUIColor(by color: Color) -> UIColor {
        switch self.currentColorTheme {
        case .system:
            return self.getUIColorForTraitVarious(by: color)
        case .white:
            return WhiteThemeColorTable.getUIColor(by: color)
        case .dark:
            return DarkThemeColorTable.getUIColor(by: color)
        }
    }
    
    private func getUIColorForTraitVarious(by color: Color) -> UIColor {
        return WhiteThemeColorTable.getUIColor(by: color)
    }
}
