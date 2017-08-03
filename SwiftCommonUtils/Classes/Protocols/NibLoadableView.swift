//
//  NibLoadableView.swift
//  Pods
//
//  Created by Michael Henry Pantaleon on 2017/08/04.
//
//

import UIKit

protocol NibLoadableView {
    static var nib:UINib { get }
}

extension NibLoadableView where Self: UIView {
    static var nib: UINib {
        let className = String(describing: self)
        return UINib(nibName: className, bundle: Bundle(for: self))
    }
}
