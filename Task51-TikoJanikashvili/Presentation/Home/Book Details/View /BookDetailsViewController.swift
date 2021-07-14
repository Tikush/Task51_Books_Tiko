//
//  BookDetailsViewController.swift
//  Task51-TikoJanikashvili
//
//  Created by Tiko on 13.07.21.
//

import UIKit
import Kingfisher

class BookDetailsViewController: BaseViewController {

    @IBOutlet private weak var bookImage: UIImageView!
    
    var image: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookImage.kf.setImage(with: URL(string: image ?? ""))
    }
}
