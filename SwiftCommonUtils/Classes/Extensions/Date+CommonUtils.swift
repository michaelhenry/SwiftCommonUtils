//
//  Date+CommonUtils.swift
//  Pods
//
//  Created by Michael on 2017/08/14.
//
//

import Foundation

public extension Date {
    
    public func format(format: String) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
}
