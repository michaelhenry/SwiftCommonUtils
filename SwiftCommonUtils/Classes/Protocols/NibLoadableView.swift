//
//  NibLoadableView.swift
//  Pods
//
//  Created by Michael Henry Pantaleon on 2017/08/04.
//
//

import UIKit

public protocol NibLoadableView {
    static var nib:UINib { get }
}

public extension NibLoadableView where Self: UIView {
    public static var nib: UINib {
        let className = String(describing: self)
        return UINib(nibName: className, bundle: Bundle(for: self))
    }
}
