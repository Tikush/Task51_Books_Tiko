//
//  AuthorsCell.swift
//  Task51-TikoJanikashvili
//
//  Created by Tiko on 14.07.21.
//

import UIKit
import Kingfisher

class AuthorsCell: UICollectionViewCell {

    @IBOutlet weak var authorImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        authorImage.layer.cornerRadius = 12
    }
    
    func configure(with item: Author) {
        print(item.image)
        authorImage.kf.setImage(with: URL(string: item.image ?? ""))
    }
}
