//
//  UICollectionViewCellExtension.swift
//  Task15-TikoJanikashvili
//
//  Created by Tiko on 20.05.21.
//

import UIKit

extension UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }

    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
