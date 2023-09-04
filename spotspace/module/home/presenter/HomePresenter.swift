//
//  HomePresenter.swift
//  spotspace
//
//  Created by Adil Özdemir on 4.09.2023.
//

import Foundation

protocol HomePresenterProtocol: AnyObject {
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorProtocol? { get set }
    var router: HomeRouterProtocol? { get set }
    func interactorDidFetchSpots(with result: Result<[Spot], Error>)
    
}

class HomePresenter: HomePresenterProtocol {
    
    var view: HomeViewProtocol?
    
    var interactor: HomeInteractorProtocol?
    
    var router: HomeRouterProtocol?
    
    func interactorDidFetchSpots(with result: Result<[Spot], Error>) {
        
    }
}
