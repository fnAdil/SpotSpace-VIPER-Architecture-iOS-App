//
//  HomeViewController.swift
//  spotspace
//
//  Created by Adil Özdemir on 4.09.2023.
//

import Foundation
import UIKit

protocol HomeViewProtocol: AnyObject {
    var presenter: HomePresenterProtocol? { get set }
    func update(with spot: [Spot])
    func update(with error: String)
}

protocol SpotTableDelegate: AnyObject {
    func updateFavoriteCell(for spotId: Int, isFavorite: Bool)
}

class HomeViewController: HomeViewProtocol {
    
    var presenter: HomePresenterProtocol?
    
    func update(with spot: [Spot]) {
        
    }
    
    func update(with error: String) {
        
    }
}
