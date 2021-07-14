//
//  CoverCell.swift
//  Task51-TikoJanikashvili
//
//  Created by Tiko on 13.07.21.
//

import UIKit

class CoverCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var backView: UIView!
    
    private var viewModel: CoverViewModelProtocol!
    private var datasource: CoverDataSource!
    private var coordinator: CoordinatorProtocol?
    private var books: [Book] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
        backView.insertSubview(coverImageView, belowSubview: collectionView)
        collectionView.backgroundColor = .clear
    }
    
    private func setupLayout() {
        collectionView.registerNib(class: CoverItemCell.self)
    }
    
    func configure(with books: [Book], coordinator: CoordinatorProtocol) {
        self.books = books
        self.coordinator = coordinator
        configureViewModel()
    }
    
    private func configureViewModel() {
        viewModel = CoverViewModel(with: coordinator!)
        datasource = CoverDataSource(with: collectionView, books: books, viewModel: viewModel)
    }
}

