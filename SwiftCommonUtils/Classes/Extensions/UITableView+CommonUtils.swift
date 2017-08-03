//
//  UITableView+CommonUtils.swift
//  Pods
//
//  Created by Michael Henry Pantaleon on 2017/08/04.
//
//

import UIKit

extension UITableView {

    func register<T: UITableViewCell >(_: T.Type)
        where T:ReusableView, T:NibLoadableView {
            register(T.nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
}

