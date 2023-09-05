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

class HomeViewController: UIViewController, HomeViewProtocol {
    
    var presenter: HomePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
    }
    
    func update(with spot: [Spot]) {
        
    }
    
    func update(with error: String) {
        
    }
}
