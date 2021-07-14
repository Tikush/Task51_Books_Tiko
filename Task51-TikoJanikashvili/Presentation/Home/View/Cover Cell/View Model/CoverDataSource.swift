//
//  CoverDataSource.swift
//  Task51-TikoJanikashvili
//
//  Created by Tiko on 13.07.21.
//

import UIKit

class CoverDataSource: NSObject, UICollectionViewDataSource {
    
    private var collectionView: UICollectionView!
    private var viewModel: CoverViewModelProtocol!
    private var books: [Book] = []
    
    init(with collectionView: UICollectionView, books: [Book], viewModel: CoverViewModelProtocol) {
        super.init()
        
        self.collectionView = collectionView
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.viewModel = viewModel
        self.books = books
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(CoverItemCell.self, for: indexPath)
        cell.configure(with: books[indexPath.row])
        return cell
    }
}

extension CoverDataSource: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.coordinator.proceedToBookDetails(with: books[indexPath.row].image ?? "")
    }
}

extension CoverDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width / 3, height: collectionView.bounds.width / 3 * 1.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}
