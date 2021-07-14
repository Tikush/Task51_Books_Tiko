//
//  BestsellingDataSource.swift
//  Task51-TikoJanikashvili
//
//  Created by Tiko on 13.07.21.
//

import UIKit

class BestsellingDataSource: NSObject, UICollectionViewDataSource {

    private var collectionView: UICollectionView!
    private var viewModel: BestsellingViewModelProtocol!
    private var authors: [Author] = []
    
    init(with collectionView: UICollectionView, viewModel: BestsellingViewModelProtocol, authors: [Author]) {
        super.init()
        
        self.collectionView = collectionView
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.viewModel = viewModel
        self.authors = authors
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("result - \(authors.count)")
        return authors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(BestsellingItemCell.self, for: indexPath)
        cell.configure(with: authors[indexPath.row])
        return cell
    }
}

extension BestsellingDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width / 3, height: collectionView.bounds.height )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}
