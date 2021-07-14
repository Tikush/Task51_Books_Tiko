//
//  HomeViewController.swift
//  Task51-TikoJanikashvili
//
//  Created by Tiko on 12.07.21.
//

import UIKit

class HomeViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: HomeViewModelProtocol!
    private var dataSource: HomeDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        configureViewModel()
        coordinator?.homeServiceManager?.fetchHomeData()
    }
    
    private func setupLayout() {
        tableView.registerNib(class: CoverCell.self)
        tableView.registerNib(class: BestsellingCell.self)
    }
   
    private func configureViewModel() {
        viewModel = HomeViewModel(with: self)
        dataSource = HomeDataSource(with: tableView, viewModel: viewModel)
        dataSource.loadBooks()
        dataSource.loadAuthors()
    }
}
