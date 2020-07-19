//
//  UIView+Extensions.swift
//  test3
//
//  Created by Yurik on 17.7.20.
//  Copyright © 2020 Yurik. All rights reserved.
//

import UIKit

extension UIView {
    @discardableResult   // 1
    func fromNib<T : UIView>() -> T? {
        guard let contentView = Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? T else {
            // xib not loaded, or its top view is of the wrong type
            return nil
        }
        self.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: contentView.superview!.topAnchor, constant: 0).isActive = true
        contentView.leftAnchor.constraint(equalTo: contentView.superview!.leftAnchor, constant: 0).isActive = true
        contentView.rightAnchor.constraint(equalTo: contentView.superview!.rightAnchor, constant: 0).isActive = true
        contentView.bottomAnchor.constraint(equalTo: contentView.superview!.bottomAnchor, constant: 0).isActive = true
        return contentView
    }
}
