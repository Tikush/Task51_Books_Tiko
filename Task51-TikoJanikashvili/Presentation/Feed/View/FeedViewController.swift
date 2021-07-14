//
//  FeedViewController.swift
//  Task51-TikoJanikashvili
//
//  Created by Tiko on 12.07.21.
//

import UIKit

class FeedViewController: BaseViewController {

    // MARK:  - IBOutlets
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var contentImage: UIImageView!
    
    private var viewModel: FeedViewModelProtocol!
    private var datasource: FeedDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        configureViewModel()
        coordinator?.feedServiceManager?.fetchFeedData()
    }
    
    private func setupLayout() {
        collectionView.registerNib(class: AuthorsCell.self)
    }
    
    private func configureViewModel() {
        viewModel = FeedViewModel(with: self)
        datasource = FeedDataSource(with: collectionView, viewModel: viewModel)
        datasource.refresh()
    }
}
