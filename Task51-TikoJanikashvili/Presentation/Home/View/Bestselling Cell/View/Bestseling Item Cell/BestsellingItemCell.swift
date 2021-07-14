//
//  BestsellingItemCell.swift
//  Task51-TikoJanikashvili
//
//  Created by Tiko on 13.07.21.
//

import UIKit
import Kingfisher

class BestsellingItemCell: UICollectionViewCell {
    
    @IBOutlet weak var authorImage: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(with item: Author) {
        authorLabel.text = item.name
        let processor = DownsamplingImageProcessor(size: authorImage.bounds.size)
                     |> RoundCornerImageProcessor(cornerRadius: 20)
        authorImage.kf.indicatorType = .activity
        authorImage.kf.setImage(
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
