//
//  BestsellingViewModel.swift
//  Task51-TikoJanikashvili
//
//  Created by Tiko on 13.07.21.
//

import Foundation

protocol BestsellingViewModelProtocol: AnyObject {
    var coordinator: CoordinatorProtocol { get }
    
    init(with coordinator: CoordinatorProtocol)
}

final class BestsellingViewModel: BestsellingViewModelProtocol {
    private(set) var coordinator: CoordinatorProtocol
  
    init(with coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
    }
}
