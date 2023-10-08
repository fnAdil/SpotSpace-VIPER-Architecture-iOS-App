//
//  HomePresenter.swift
//  spotspace
//
//  Created by Adil Özdemir on 4.09.2023.
//

import Foundation

enum FetchError: Error {
    case failed
}

protocol HomePresenterProtocol: AnyObject {
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorProtocol? { get set }
    var router: HomeRouterProtocol? { get set }
    func interactorDidFetchSpots(with result: Result<[Spot], Error>)
    func updateFavourite(with spot: Spot)
    func interactorDidFetchFavourite(with result: Result<Spot, Error>)
}

class HomePresenter: HomePresenterProtocol {
    
    var view: HomeViewProtocol?
    
    var router: HomeRouterProtocol?
    
    var interactor: HomeInteractorProtocol? {
        didSet {
            interactor?.getSpots()
        }
    }
    
    func interactorDidFetchSpots(with result: Result<[Spot], Error>) {
        switch result {
        case .failure:
            self.view?.update(with: "Error")
        case .success(let spots):
            self.view?.update(with: spots)
        }
    }
    
    func updateFavourite(with spot: Spot) {
        interactor?.updateFavourite(with: spot)
    }
    
    func interactorDidFetchFavourite(with result: Result<Spot, Error>) {
        switch result {
        case .failure:
            self.view?.updateFavourite(with: "Error")
        case .success(let spots):
            self.view?.updateFavourite(with: spots)
        }
    }
}
