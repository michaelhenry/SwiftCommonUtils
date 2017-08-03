//
//  ReusableView.swift
//  Pods
//
//  Created by Michael Henry Pantaleon on 2017/08/04.
//
//

import UIKit

protocol ReusableView {
    static var reuseIdentifier: String { get }
}

extension ReusableView {
    public static var reuseIdentifier: String {
        let className = String(describing: self)
        return "\(className)_Identifier"
    }
}

