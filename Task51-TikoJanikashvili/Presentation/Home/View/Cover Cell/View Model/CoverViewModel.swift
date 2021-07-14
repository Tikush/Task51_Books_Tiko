//
//  CoverViewModel.swift
//  Task51-TikoJanikashvili
//
//  Created by Tiko on 13.07.21.
//

import UIKit

protocol CoverViewModelProtocol: AnyObject {
    var coordinator: CoordinatorProtocol { get }
    
    init(with coordinator: CoordinatorProtocol)
}

final class CoverViewModel: CoverViewModelProtocol {
    
    private(set) var coordinator: CoordinatorProtocol
  
    init(with coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
    }
}
