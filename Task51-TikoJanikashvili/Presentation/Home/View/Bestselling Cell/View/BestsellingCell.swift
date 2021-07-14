//
//  BestsellingCell.swift
//  Task51-TikoJanikashvili
//
//  Created by Tiko on 13.07.21.
//

import UIKit

class BestsellingCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var viewModel: BestsellingViewModelProtocol!
    private var datasource: BestsellingDataSource!
    private var coordinator: CoordinatorProtocol!
    private var authors: [Author] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupLayout()
    }
    
    private func setupLayout() {
        collectionView.registerNib(class: BestsellingItemCell.self)
    }
    
    func configure(with authors: [Author], coordinator: CoordinatorProtocol) {
        self.authors = authors
        self.coordinator = coordinator
        configureViewModel()
    }
    
    private func configureViewModel() {
        viewModel = BestsellingViewModel(with: coordinator!)
        datasource = BestsellingDataSource(with: collectionView, viewModel: viewModel, authors: authors)
    }
}
