//
//  UITableView+CommonUtils.swift
//  Pods
//
//  Created by Michael Henry Pantaleon on 2017/08/04.
//
//

import UIKit

public extension UITableView {

    public func register<T: UITableViewCell >(_: T.Type) {
            register(T.nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
}

