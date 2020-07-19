//
//  MainNavigationController.swift
//  test3
//
//  Created by Yurik on 17.7.20.
//  Copyright © 2020 Yurik. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {
    private var backgroundView: UIView?
    private var imageView: UIImageView?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        switch ColorThemeManager.shared.currentColorTheme {
        case .white: return .default
        case .dark: return .lightContent
        default: return .default
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.configureTabBar()
        self.configureColors()
    }
    
    private func configureTabBar() {
        self.navigationBar.prefersLargeTitles = true
        self.navigationBar.isTranslucent = true
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.backgroundView = self.setupBackgroundView()
    }
    
    private func setupBackgroundView() -> UIView {
        let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        let frame = self.navigationBar.frame.insetBy(dx: 0, dy: -(statusBarHeight)).offsetBy(dx: 0, dy: -(statusBarHeight))
        let view = UIView(frame: frame)
        view.isUserInteractionEnabled = false
        view.backgroundColor = UIColor.white
        self.navigationBar.addSubview(view)
        self.navigationBar.sendSubview(toBack: view)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.layer.zPosition = -1
        return view
    }
    
//    override func popViewController(animated: Bool) -> UIViewController? {
//        (self.viewControllers.last?.navigationItem.searchController as? MainSearchController)?.removeBackgroundView()
//        return super.popViewController(animated: animated)
//    }
}

extension MainNavigationController: ThemeAble {
    func configureColors() {
        var largeTitleTextAttributes = self.navigationBar.largeTitleTextAttributes ?? [:]
        largeTitleTextAttributes.updateValue(
            ColorThemeManager.shared.getUIColor(by: .text),
            forKey: NSAttributedStringKey.foregroundColor
        )
        self.navigationBar.largeTitleTextAttributes = largeTitleTextAttributes
        var titleTextAttributes = self.navigationBar.titleTextAttributes ?? [:]
        titleTextAttributes.updateValue(
            ColorThemeManager.shared.getUIColor(by: .text),
            forKey: NSAttributedStringKey.foregroundColor
        )
        self.navigationBar.titleTextAttributes = titleTextAttributes
        self.backgroundView?.backgroundColor = ColorThemeManager.shared.getUIColor(by: .background)
        self.view.backgroundColor = ColorThemeManager.shared.getUIColor(by: .background)
        self.setNeedsStatusBarAppearanceUpdate()
    }
}

extension MainNavigationController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
    }
    
    private func findShadowImage(under view: UIView) -> UIImageView? {
        if view is UIImageView && view.bounds.size.height <= 1 {
            return (view as! UIImageView)
        }
        
        for subview in view.subviews {
            if let imageView = findShadowImage(under: subview) {
                return imageView
            }
        }
        return nil
    }
}

extension MainNavigationController {
    enum Style {
        case normal
        case transparent(tintColor: UIColor)
    }
    
    static func navBarStyle(for viewController: UIViewController) -> Style {
        if viewController is ThirdViewController {
            return .transparent(tintColor: .white)
        }
        return .normal
    }
}
