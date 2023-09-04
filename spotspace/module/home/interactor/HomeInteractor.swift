//
//  HomeInteractor.swift
//  spotspace
//
//  Created by Adil Özdemir on 4.09.2023.
//

import Foundation

protocol HomeInteractorProtocol: AnyObject {
    var presenter: HomePresenterProtocol? { get set }
    func getSpots()
}

class HomeInteractor: HomeInteractorProtocol {
    var presenter: HomePresenterProtocol?
    
    func getSpots() {
        
    }
}
