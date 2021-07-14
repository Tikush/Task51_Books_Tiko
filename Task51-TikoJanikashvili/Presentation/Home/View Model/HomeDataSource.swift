//
//  HomeDataSource.swift
//  Task51-TikoJanikashvili
//
//  Created by Tiko on 13.07.21.
//

import UIKit

class HomeDataSource: NSObject, UITableViewDataSource {
    
    private var tableView: UITableView!
    private var viewModel: HomeViewModelProtocol!
    private var books = [Book]()
    private var authors = [Author]()
    
    init(with tableView: UITableView, viewModel: HomeViewModelProtocol) {
        super.init()
        
        self.tableView = tableView
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.viewModel = viewModel
    }
    
    func loadBooks() {
        viewModel.fetchBooks { [weak self] result in
            switch result {
            case .success(let books):
                self?.books = books
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let err):
                print(err)
            }
        }
    }
    
    func loadAuthors() {
        viewModel.fetchAuthors { [weak self] result in
            switch result {
            case .success(let authors):
                self?.authors = authors
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.deque(CoverCell.self, for: indexPath)
            if !books.isEmpty {
                cell.configure(with: books, coordinator: viewModel.controller.coordinator!)
            }
            return cell
        case 1:
            let cell = tableView.deque(BestsellingCell.self, for: indexPath)
            if !authors.isEmpty {
                cell.configure(with: authors, coordinator: viewModel.controller.coordinator!)
            }
            return cell
        default:
            return UITableViewCell()
        }
    }
}

extension HomeDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
