//
//  CoverItemCell.swift
//  Task51-TikoJanikashvili
//
//  Created by Tiko on 13.07.21.
//

import UIKit
import Kingfisher

class CoverItemCell: UICollectionViewCell {

    @IBOutlet weak var bookImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bookImage.layer.cornerRadius = 15
    }

    func configure(with item: Book) {
        let processor = DownsamplingImageProcessor(size: bookImage.bounds.size)
                     |> RoundCornerImageProcessor(cornerRadius: 20)
        bookImage.kf.indicatorType = .activity
        bookImage.kf.setImage(
            with: URL(string: item.image ?? ""),
            placeholder: UIImage(named: "placeholderImage"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        {
            result in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
    }
}


