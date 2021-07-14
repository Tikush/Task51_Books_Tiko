//
//  UITableViewCell+Extension.swift
//  Lecture 44
//
//  Created by Nika Kirkitadze on 30.06.21.
//

import UIKit

extension UITableViewCell {
    
    static var identifier: String { String(describing: self) }
    
    static func nib() -> UINib { UINib(nibName: identifier, bundle: Bundle.main) }
}
