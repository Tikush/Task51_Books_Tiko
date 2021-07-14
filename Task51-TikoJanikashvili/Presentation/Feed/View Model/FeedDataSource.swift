//
//  FeedDataSource.swift
//  Task51-TikoJanikashvili
//
//  Created by Tiko on 14.07.21.
//

import UIKit

class FeedDataSource: NSObject, UICollectionViewDataSource {
    
    // MARK: - Private Properties
    private var collectionView: UICollectionView!
    private var viewModel: FeedViewModelProtocol!
    private var authors: [Author] = []
    
    init(with collectionView: UICollectionView, viewModel: FeedViewModelProtocol) {
        super.init()
        
        self.collectionView = collectionView
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.viewModel = viewModel
    }
    
    func refresh() {
        viewModel.fetchAuthors { [weak self] result in
            switch result {
            case .success(let authors):
                self?.authors = authors
                print(self?.authors)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        authors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(AuthorsCell.self, for: indexPath)
        cell.configure(with: authors[indexPath.row])
        return cell
    }
}

extension FeedDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.bounds.width / 3, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}

