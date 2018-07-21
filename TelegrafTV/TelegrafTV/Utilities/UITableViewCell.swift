//
//  UITableViewCell.swift
//  TelegrafTV
//
//  Created by Pedja Jevtic on 7/21/18.
//  Copyright © 2018 Pedja Jevtic. All rights reserved.
//

import Foundation

import UIKit

extension UITableViewCell {
    
    class func fromNib<T: UITableViewCell>() -> T {
        guard let cell = Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)?[0] as? T else {
            print("Error: missing XIB for cell named: \(String(describing: T.self))")
            return (UITableViewCell() as? T)!
        }
        return cell
    }
    
    static func name() -> String {
        return description().replacingOccurrences(of: "Poetiv.", with: "")
    }
    
}
